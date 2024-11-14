#!/usr/bin/bash

#Basic Usage
echo "$RANDOM"

# in specific range
# RANDOM % {Length} + {start}
echo "$(( (RANDOM % 10) + 1 ))"