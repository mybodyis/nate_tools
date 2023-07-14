#!/bin/bash
echo "Nate bash tools version 0.2"
#Author: Nathaniel "Nate" Lewis
#Date: 7/13/23
#Purpose: This file contains functions that are useful for AI workload bash scripts.
#Released as is with no warranty. Use at your own risk. Under MIT License.

#Version History:
#Version 0.1 7/13/23:
#Initial version.
#Added factorize and full_bs_sweep functions.
#Version 0.2 7/14/23:
#Added factorize_cpu function.

#Generate an array of numbers that goes into the provided number.
#EX: 22 -> 1 2 11 22
function factorize() {
    local n=$1
    local i=1
    local factors=""
    while [ $i -lt $n ]; do
        if [ $((n % i)) -eq 0 ]; then
            factors="$factors $i"
        fi
        i=$((i + 1))
    done
    echo $factors
}

#Returns the CPI factors that can be used on the current system based on the CPU count.
function factorize_cpu() {
    local n=`lscpu | grep "CPU(s):" | awk '{print $2}' | head -n 1`
    local i=1
    local factors=""
    while [ $i -lt $n ]; do
        if [ $((n % i)) -eq 0 ]; then
            factors="$factors $i"
        fi
        i=$((i + 1))
    done
    echo $factors
}

#Returns the Batch Sizes needed for a full sweep.
function full_bs_sweep() {
    echo "1 2 4 8 16 32 64 128"
}