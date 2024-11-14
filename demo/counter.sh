#!/usr/bin/bash

#date is a command to print the current date.
date

#prints the date in seconds format
echo $(date +%s)
# Start the timer
start_time=$(date +%s)

# Function to update and display elapsed time & run as a background to run parallel
# while true; do
#   current_time=$(date +%s)
#   elapsed=$((current_time - start_time))
#   echo -ne "Elapsed time: $elapsed seconds\r"
#   sleep 1
# done



# This demo tries to run a timer parallel to the user input

# Function to run the timer
timer() {
  seconds=0
  while true; do
    printf "\rTimer: %02d:%02d" $((seconds / 60)) $((seconds % 60))
    sleep 1
    ((seconds++))
  done
}

# Start the timer in the background
# By calling timer &, we run it in the background, which allows the rest of the script to continue executing in parallel.
timer &
# The line TIMER_PID=$! stores the PID of the background process started by timer &
TIMER_PID=$!

# Allow user input while the timer is running
echo -e "\nEnter your input below (type 'exit' to quit):"
while true; do
  read -p "Input: " user_input
  if [ "$user_input" == "exit" ]; then
    break
  fi
  echo "You entered: $user_input"
done

# Stop the timer process
kill $TIMER_PID
echo -e "\nTimer stopped."

# capture ctrl+c to stop background timer
trap "echo -e '\nTimer stopped by user'; kill $TIMER_PID; exit" SIGINT