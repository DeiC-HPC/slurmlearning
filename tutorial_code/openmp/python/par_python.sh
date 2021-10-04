#!/bin/bash
#SBATCH --output="out.txt"
#SBATCH --error="err.txt"
#SBATCH --time=00:00:30
#SBATCH --mem=50M
#SBATCH --cpus-per-task=2

python3 main.py
