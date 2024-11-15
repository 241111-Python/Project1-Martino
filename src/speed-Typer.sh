#!/usr/bin/bash

#setup variables and load the words list

function setUp() {
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    config_file="$script_dir/../config.cfg"
    if [[ -f "$config_file" ]]; then
        source "$config_file"
    else
        echo "Configuration file not found! Make sure 'config.cfg' exists."
        exit 1
    fi
    score=0
    textFilePath="${gamePath}/resource/${textFile}";
    words=()
    if [[ -f "$textFilePath" ]]; then
        while IFS= read -r line; do
            words+=("$line")
        done < "$textFilePath"
    else
        echo "Text file not found at $textFilePath! Check the path in config.cfg."
        exit 1
    fi    
    wordLength="${#words[@]}"
}

#function to get a random word from a word list
function getRandomWord() {
    echo "${words[$(( RANDOM % wordLength ))]}"
}

# Timer Update
function timer() {
    #counter starts
    start_time=$(date +%s)
    while true; do
        current_time=$(date +%s)
        elapsed_time=$((current_time - start_time))
        time_remaining=$((time_limit - elapsed_time))

        # save current cursor position
        tput sc
        # Move cursor to the top-left and print time remaining
        if (( time_remaining >= 0 )); then
            tput cup 0 0
            # Move to the top of the screen and display remaining time and score
            echo -n "Time Remaining: $time_remaining seconds     "

        else
            echo "timer up! Game Over!"
            kill -s SIGTERM "$$"
            break
        fi

        tput rc
        sleep 1
    done 
}
function game() {
    trap "endGame; exit" SIGTERM

    targetWord=()
    typedWord=()
    timesTaken=()
    rightOrWrong=()
    while true; do
        word=$(getRandomWord) # Get a random word
        tput cup 2 0
        echo "Score: ${score}"
        echo "Type the word: $word"

        # recieve input, also record typing time
        typeStartTime=$(date +%s.%3N)
        read userInput
        typeEndTime=$(date +%s.%3N)

        # use awk to record in seconds with 3 decimals.
        typingTime=$(awk "BEGIN {printf \"%.3f\", $typeEndTime - $typeStartTime}")

        # Overwrites  the input
        echo -ne "\r$(printf '%*s' ${#userInput})"
        targetWord+=("$word")
        typedWord+=("$userInput")
        timesTaken+=("$typingTime")
        if [[ "$word" == "$userInput" ]]; then
            score=$((score + "${#word}"))
            rightOrWrong+=(true)
        else
            rightOrWrong+=(false)
        fi

    done
}

function endGame() {
    echo "Thank you for playing!"
    rightName="n"
    while [[ -z "$username" || ( "$rightName" != "y" && "$rightName" != "yes" ) ]]; do
        echo "What is your name?: "
        read username
        echo "Is ${username} right?(y/n)"
        read rightName
    done
    data=""
    for ((i=0; i<${#targetWord[@]}; i++)); do
        data+="(${targetWord[i]}, ${typedWord[i]}, ${timesTaken[i]},${rightOrWrong[i]})"
        if [[ $i -lt $((${#targetWord[@]} - 1)) ]]; then
            data+=", "
        fi
    done

    echo "$username, $score, [$data]" >> "${gamePath}/data/game-data.log"
}

function main() {
    #starting the game
    setUp
    clear
    echo "Welcome to the speed typer game! you will have ${time_limit} to crunch out the words!"
    #starting by pressing enter.
    echo "press [enter] to start the game!"
    read
    clear

    timer & 
    timer_pid=$!
    trap "echo -e '\nGame stopped by user'; kill $timer_pid;  exit" SIGINT
    # Game loop
    game
}

main