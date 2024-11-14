#!/usr/bin/bash

# Clear the screen to start with a clean display
clear

echo "This is the starting line."

# Move the cursor up by 2 lines
# The general form is \033[{N}A, 
# where {N} is the number of lines you want to move up.
echo -e "\033[2A"
echo "Moved up 2 lines."

# Move the cursor down by 1 line
# \033[1B: Moves the cursor down by 1 line
echo -e "\033[1B"
echo "Moved down 1 line."

# Move the cursor right by 10 columns
echo -e "\033[10C"
echo "Moved 10 columns to the right."

# Move the cursor left by 5 columns
# \033[5D: Moves the cursor left by 5 columns.
echo -e "\033[5D"
echo "Moved 5 columns to the left."

# Return the cursor to the start of the current line
# \r (carriage return): Moves the cursor to the beginning of the current line. 
echo -e "\r"
echo "Back to the start of this line."

# Move the cursor to a specific position (row 10, column 20)
# \033[10;20H: Moves the cursor to an absolute position, specifically row 10, column 20
echo -e "\033[10;20H"
echo "Positioned at row 10, column 20."

# End with a message
echo -e "\n\n"
echo "Demo complete!"

# tput cup also used to move cursor
# Move cursor to the top-left and print time remaining
tput cup 0 0