#!/bin/bash

# Function to check for errors
check_exit_status() {
    if [ $? -ne 0 ]; then
        echo "Error occurred while executing $1. Exiting script."
        exit 1
    fi
}

# Execute transcriptfiles.py
echo "Collecting latest earnings call transcripts data..."
python3 transcriptfiles.py
check_exit_status "transcriptfiles.py"

# Execute secfiles.py
echo "Collecting latest SEC files data..."
python3 secfiles.py
check_exit_status "secfiles.py"

# Execute prepdocs.sh for data ingestion
echo "Preparing documents for data ingestion..."
bash ./scripts/prepdocs.sh
check_exit_status "./scripts/prepdocs.sh"

echo "All tasks completed successfully!"
