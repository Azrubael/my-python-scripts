#!/bin/bash

old_file="./passwd"
new_file="./passwd_new"
tmp_file="./passwd_tmp"

# a) Copy file ./passwd to ./passwd_new
if [ ! -f "$old_file" ]; then
    echo "Error: $old_file file not found."
    exit 1
fi

cp -f $old_file $new_file

if [ ! -f "$new_file" ]; then
    echo "Error: Failed to create $new_file file."
    exit 1
fi
echo "a) file $new_file created successfully."


# b) Find and replace 'saned' entry using awk
if awk -F: '/^saned:/ && $NF == "/usr/sbin/nologin" { $NF = "/bin/bash" } 1' OFS=: $new_file > $tmp_file && mv $tmp_file $new_file; then
    echo "b) 'saned' entry updated successfully."
else
    echo "Error updating saned entry."
fi


# c) Find and replace 'avahi' entry using sed
if sed -i '/^avahi:.*:\/usr\/sbin\/nologin$/ s/:\/usr\/sbin\/nologin$/:\/bin\/bash/' $new_file; then
    echo "c) 'avahi' entry updated successfully."
else
    echo "Error updating avahi entry."
fi


# d) Save only 1-st 3-th 5-th 7-th columns of each string based on `:` delimiter 
awk -F: '{print $1 ":" $3 ":" $5 ":" $7}' "$new_file" > "$tmp_file"
echo "d) Saved only 1-st 3-th 5-th 7-th columns in $tmp_file."


# e) Remove lines containing 'daemon'
if sed -i '/daemon/d' $tmp_file; then
    echo "e) Lines containing 'daemon' removed successfully from $tmp_file."
else
    echo "Error removing lines containing 'daemon'."
fi
mv -f $tmp_file $new_file


### f) Even UID shell replacement
while IFS=":" read -r username uid description shell; do
    if [[ $uid =~ ^[0-9]+$ ]]; then
        if [ $((uid % 2)) -eq 0 ]; then
            echo "$username:$uid:$description:/bin/zsh" >> "$tmp_file"
            continue
        fi
    fi
	echo "$username:$uid:$description:$shell" >> "$tmp_file"
done < "$new_file"
mv -f $tmp_file $new_file
echo "f) Even UID shell replacement"


### g) Remove new line at the end of file if it exists
sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' $new_file
filesize=$(wc -c < "$new_file")
truncate -s $(( filesize - 1 )) "$new_file"
echo "g) New line at the end of file removed successfully."
