#!/usr/bin/bash

top_scorer() {
    local data=("$@")
    declare -a score_list
    # for line in "${data[@]}"; do
    #     echo "$line"
    # done
    for line in "${data[@]}"; do
        IFS=',' read -ra fields <<< "$line"

        user="${fields[0]}"
        score="${fields[1]}"

        score_list+=("$score $user")
    done 

    for entry in "${score_list[@]}"; do
        echo "$entry"
        # 1. get the entries
        # 2. sort the entries 
        #       reverse, numeric, first field based sort
        # 3. pick top 10 with head
        # 4. Print the result with formatting
        #       -v: external bash parameter
        #       $rank starts from 1, incrementing. Provided by awk.
        #       printing in format [{rank}. {username} : {score}]
    done | sort -rn -k1 | head -n 10 | awk -v rank="$rank" '{
        if (NR == 1) rank = 1;
        printf "%d. %s: %s\n", rank, $2, $1;
        rank++;
    }'
}
