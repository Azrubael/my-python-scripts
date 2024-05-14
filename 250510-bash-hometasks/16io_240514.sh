#!/bin/bash

echo -n "Enter a file name to record a poem: "
read poem_filename

cat << EOF > $poem_filename
An old silent pond...
A frog jumps into the pond,
splash! Silence again.

Autumn moonlight-
a worm digs silently
into the chestnut.

In the twilight rain
these brilliant-hued hibiscus -
A lovely sunset.
EOF

echo "Task finished" > stderr