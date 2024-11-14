#!/usr/bin/bash
# Declare an array to hold the words

FILE="../words.txt"
words=()

# Read each line (word) from the file
while IFS= read -r line; do
  words+=("$line")  # Add each word to the array
done < "$FILE"

# # Print each word on a new line
# for word in "${words[@]}"; do
#   echo "$word"
# done

# Print length of array
echo "Length: ${#words[@]}"