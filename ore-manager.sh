#!/bin/bash

# Default configuration
DEFAULT_THREADS=140

# Parse command line arguments
THREADS=${1:-$DEFAULT_THREADS}

# Function to check balance
check_balance() {
    echo "Checking ORE balance..."
    ore balance
}

# Function to check unclaimed balance
check_unclaimed() {
    echo "Checking unclaimed balance..."
    ore rewards
}

# Function to claim rewards
claim_rewards() {
    echo "Claiming rewards..."
    ore claim
}

# Function to start mining
start_mining() {
    echo "Starting mining process..."
    ore mine --cores "$THREADS" --dynamic-fee
}

# Main loop
while true; do
    # Check current balance
    check_balance
    # Check and claim unclaimed rewards
    check_unclaimed
    # claim_rewards
    # Start mining
    start_mining
    # If mining exits, wait 5 seconds before restarting
    echo "Mining process exited. Restarting in 5 seconds..."
    sleep 5
done 