# P1 - Bash Script
### *Presentations will be Nov. 15*
## *Develop a small bash script*
### "The Program"
Some recommendations are:
- flipping a coin
- high-low (guessing a number with the feedback of "higher!" or "lower!")
- rock-paper-scissors

While the specifics of the program are up to you, it should be something
that you can plan to gather statistics from.  For example, a win/loss tracker, or a leaderboard.

Technical requirements:
- The program must be written as a Bash script. - The Program
- You must complete and present your own work:
    - plagerism of any kind will not be tolerated.
    - you may (and are encouraged to) collaborate and assist others in the cohort.
    - AI may be used to assist, not to do the work for you.
        - asking ChatGPT how to generate a random value is fine.
        - asking ChatGPT to develop a program for you is not.
- The statistics generated must be written to a separate file.
- The program must run without errors.

## *Update: Data output and anlysis*
### "The Data File, Analyzer, and Library"
Your script should produce and save some data to a file. This should be relavent to the purpose of the script,
like tracking a win/loss count. Create a second scipt that will analyze your data file.

Technical requirements:
- Your program must collect and keep data of some kind in a separate file. - The Data File
    - More data is better for analysis!
- You must create a second script to anaylze your programs data file. - The Analyzer
    - The analyzer should be capable of reading the data file, and extracting important data.
- The analyzer or program should feature functions to keep repeatable blocks of scripting, and should keep at least one function in a separate library file. - The Library

## *Update: Cronjob*
### "The Cronjob"
Use a cronjob to execute your Analyzer on a set schedule.