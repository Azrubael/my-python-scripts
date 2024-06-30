#!/bin/bash

: <<'TASK'
* Write a script that takes the filename of the CSV file as an argument.
* Display the content of the CSV file at the beginning of the script.
* Parse the CSV file, considering it has four fields and the third field can contain two subfields delimited by commas.
* Print out the parsed data as a table.
TASK

# Check if filename is provided as an argument
if [ ! -f "$1" ]; then
    echo "Usage: bash scriptname.sh <filename.csv>"
    exit 1
fi

filename=$1

# Check if the file is a text file
if ! file "$filename" | grep -q "text"; then
    echo "Error: File is not a text file."
    exit 1
fi

echo "Content of $filename:"
echo "---------------------"
cat "$filename"
printf "\n\n"


# Parse the CSV file
####################
# Read the first line of the text file and create an array of words
IFS=, read -r -a headers <<< "$(head -n 1 "$filename")"
H=${#headers[@]}

# Create a two-dimensional array to store the lines of the CSV file
declare -A csv_data
line_num=0

# Read each line of the CSV file and store it in the two-dimensional array
while IFS=, read -r -a line; do
    for ((i=0; i<H; i++)); do
        csv_data[$line_num,${headers[$i]}]=${line[$i]}
        if [[ "${#line[@]}" != "$H" ]] && [[ $((H-i)) -lt 2  ]] && \
            [[ -n "${line[$i+1]}" ]]
        then
            csv_data[$line_num,${headers[$i]}]+=",${line[$i+1]}"
        fi
    done
    ((line_num++))
done < <(tail -n +2 "$filename")



# Print the array of words
echo "Array of headers:"
for el in "${headers[@]}"; do
    printf "%s\t" "$el"
done
printf "\n\n"


# Print the two-dimensional array of lines
echo "CSV Data:"
for ((i=0; i<line_num; i++)); do
    for header in "${headers[@]}"; do
        echo "$header: ${csv_data[$i,$header]}"
    done
    echo "-----------------"
done