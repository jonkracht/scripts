#!/bin/bash

# Navigate to the directory containing your repositories if not already there
# cd /path/to/your/repos

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NORMAL='\033[0m' # Reset color to normal

echo -e "\n--- ${GREEN}Starting git fetch origin for all repositories${NORMAL} ---"

# Loop through all subdirectories
for d in ${PWD}/*/ ; do
    echo -e "\n\n-------------------------------------------------"
    echo -e "${GREEN}Entering directory: $d${NORMAL}"
    echo -e "---------------------------------------------------\n"

    cd "$d"
    # Check if it's a git repository
    if [ -d .git ]; then
        #git fetch origin
        git status
    else
        echo "Not a git repository, skipping."
    fi
    # Go back to the parent directory for the next iteration
    cd ..
done

echo "--- Finished git fetch origin for all repositories ---"
