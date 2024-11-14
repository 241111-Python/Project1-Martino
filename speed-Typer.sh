#!/usr/bin/bash

#setup variables and load the words list
time_limit=60 #60 seconds to play
count=0
script_dir="$(dirname "$0")"
# file_path="$script_dir/words.txt"
file_path="$script_dir/demo/sampleText.txt"
words=()
while IFS= read -r line; do
    words+=("$line")
done < "$file_path"
wordLength="${#words[@]}"

#function to get a random word from a word list
function getRandomWord() {
    echo "${words[$(( RANDOM % wordLength ))]}"
}

#starting the game
echo "Welcome to the speed typer game! you will have ${time_limit} to crunch out the words!"
#starting by pressing enter.
echo "press [enter] to start the game!"
read
clear
#counter starts
start_time=$(date +%s)

# Timer Update
function timer() {
    while true; do
        current_time=$(date +%s)
        elapsed_time=$((current_time - start_time))
        time_remaining=$((time_limit - elapsed_time))
        if ((time_remaining <= 0)); then
            echo -ne "\033[3A\rTime Remaining: $time_remaining seconds ||  score: $count\033[3B"  
        fi
    done 
}
timer & timer_pid=$!

# Game loop