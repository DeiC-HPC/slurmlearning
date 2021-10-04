#!/bin/bash
#SBATCH --job-name=hello_world_python
#SBATCH --output="out.txt"
#SBATCH --time=00:00:30

python3 main.py
