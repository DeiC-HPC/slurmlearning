make_run_file() {
cat > $1.sh <<%EOF%
#!/bin/bash
#SBATCH --job-name=$1
#SBATCH --output="out.txt"
#SBATCH --error="err.txt"
#SBATCH --time=00:00:30
#SBATCH --mem=1M

make
./main.exe
%EOF%
}

name=run_file

make_run_file ${name}
sbatch ${name}.sh
