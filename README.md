# Speed Typer

Speed Typer is a simple yet engaging typing game designed to test and improve your typing speed and accuracy. Players are tasked with typing randomly presented words within a time limit while the game tracks their performance metrics.

## Project Structure
``` 
SpeedTyper/ 
├── src/ │ 
        ├── speed-Typer.sh # Main game logic │ 
        ├── analyzer.sh # Data analysis script │ 
        ├── library.sh # library file for analyzer
├── library.sh # Utility functions (if applicable) │ 
├── config.cfg # Configuration file 
├── data/ │ 
├── game-data.log # Game data log │ 
├── stats.log # Analysis output log 
└── README.md # Project documentation 
```

## Features

### Core Gameplay
- Random words are presented to the player.
- Players earn points based on correct entries and word lengths.
- Tracks the time taken for each word and evaluates typing speed.
- Records player performance data in a log file.

### Analysis
- `analyzer.sh` processes game data for insights such as:
  - Top scorer identification.
  - User accuracy analysis.
  - Average typing speed.

## Prerequisites
- Bash shell (version 4.0 or later recommended)
- Ensure the `config.cfg` file is properly set up with the following variables:
  ```bash
  gamePath="/path/to/game"  # Root directory of the game
  textFile="words.txt"      # Name of the text file containing words
  time_limit=60             # Time limit for each game in seconds

## Setup

1. **Clone or download the repository.**
2. **Ensure `src` and `data` directories are correctly structured as shown above.**
3. **Place a valid `words.txt` file in the `/resource` folder within `gamePath` defined in `config.cfg`.**

---

## Usage

### Playing the Game

1. Navigate to the `src` directory:
   ```bash
   cd src

2. Run the main game script:
   ```bash
   ./core.sh

3. Follow on-screen instructions to play the game. Your performance will be logged in data/game-data.log.

### Analyzing Performance
1. Run the analyzer script:
   ```bash
   ./analyzer.sh
2. Results will be saved to data/stats.log:
* Top scorer
* Performance metrics (if additional features are implemented)

## Example Logs
### Game Data Log (data/game-data.log)
   ```bash
   username, score, [(word1, typedWord1, time1, true), (word2, typedWord2, time2, false)]
   ```

### Analysis Log (data/stats.log)
```
============
date: 2024-11-18
Top Scorer:
Alice - 120 points
Analysis results saved to data/stats.log.
============