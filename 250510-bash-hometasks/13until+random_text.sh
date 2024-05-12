#!/bin/bash

: <<'COMMENT1'
A script that reads a filename from user input and after combines specifyed file with itself until it reaches a size greater than 1024 KB
COMMENT1


read -p "Enter the filename: " filename
if [ ! -e "$filename" ]; then
    echo "The file $filename doesn't exist!"
    head -c 4KB /dev/urandom > $filename
    echo "The file $filename was created."
else
    echo "The file '$filename' already exist."
fi

# Check if the file is a text file
if file "$filename" | grep -q "text"; then
    echo "File $filename is a text file."
else
    echo "File $filename is not a text file."
fi


MAXSIZE=1024
nfile="new_$filename"
cp -f "$filename" "$nfile"
file_size=$(du -k "$nfile" | cut -f1)


# Loop to combine the file with itself
# until it reaches a size greater than 1024 KB
until [[ $file_size -gt MAXSIZE ]]; do
    # Concatenate the file with itself
    cp $nfile "tmp.~"
    cat "tmp.~" >> "$nfile"
    # Update the size of the file
    file_size=$(du -k "$nfile" | cut -f1)
    echo Filesize: $file_size
done

rm "tmp.~"
echo "File $nfile has reached a size of $file_size"