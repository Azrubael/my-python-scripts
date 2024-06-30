#! /bin/bash
sudo groupadd group1
sudo groupmod -g 2001 group1
sudo groupadd group2
sudo groupmod -g 2002 group2

# to create a group and simultaniously give it ID
sudo groupadd -g 9999 shared

# to create a user and simultaniously give it ID
sudo useradd -u 1001 -g group1 user1
sudo useradd -u 1002 -g group2 user2

# Create the file /tmp/test with the content "Hello user1"
echo "Hello user1" | sudo -u user1 tee /tmp/test > /dev/null
# The > /dev/null is used to suppress tee's output

echo "File created in /tmp/test with 'Hello user1' content by user1."

sudo chmod 640 /tmp/test
stat -c "%a %n" /tmp/test


# Add user1 to the 'shared' group
sudo usermod -aG shared user1
echo "Added user1 to the 'shared' group."

# Add user2 to the 'shared' group
sudo usermod -aG shared user2
echo "Added user2 to the 'shared' group."


#######################################
# Define the users and groups in arrays
Users=("user1" "user2")
Groups=("group1" "group2" "shared")

# Remove users using a loop
for user in "${Users[@]}"
do
    sudo userdel -r $user
    echo "Removed user: $user"
done

# Remove groups using a loop
for group in "${Groups[@]}"
do
    sudo groupdel $group
    echo "Removed group: $group"
done
