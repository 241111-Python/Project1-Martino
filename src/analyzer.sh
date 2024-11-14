#!/usr/bin/bash

data_file="../data/game-data.log"
stats_file="../data/stats.log"
source "./library.sh"

# Read the whole data and separate each line by newline character
IFS=$'\n' read -d '' -ra data < <(tail -n +2 "$data_file")

# Print each line
# for line in "${data[@]}"; do
#     echo "$line"
# done

echo "============" >> "$stats_file"
echo -n "date: " >> "$stats_file"
date >> "$stats_file"
# echo "User Average Typing Time:" >> "$stats_file"
# averageTypingTime "${data[@]}"                             
# echo "User Accuracy Analysis:" >> "$stats_file"
# user_accuracy "${data[@]}"
echo "Top Scorer:" >> "$stats_file"
top_scorer "${data[@]}" >> "$stats_file"
# echo "Most Common Mistakes:" >> "$stats_file"
# most_common_mistakes "${data[@]}"
echo "Analysis results saved to $stats_file."
echo "============" >> "$stats_file"