Run files
---

It is often advantageous to use a bash script to generate and run ones Slurm script.
For the user unfamiliar with shell scripting a brief introduction is in place &mdash; otherwise feel free to skip this part.

Please navigate to the directory `~/run_file/` where you will find the Hello World program from `~/hello_world/cpp/`, a Makefile and shell script called `run_prog.sh`.
Notice that lines 3-11 are essentially just an expanded version of the `slurmscript.sh` from `~/hello_world/cpp/`.

Let us go through the script so we can get an idea of what is going on. But the shell scripts are basically running commands that also could be run in the terminal.

The first line, `#!/usr/bin/env bash`, is what we call a shebang. It defines, which command is used to running the script.
Line 2-14 is a function named `make_run_file`. It then writes a slurmscript into a file, which is defined by the first argument given to the function. In shell scripts functions the arguments given are just numbered variables, `$1`, `$2` etc.

```bash
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
```

The rest of the file contains of three lines. The first assigns the variable name to `run_file`, which will then be the filename. Then the `make_run_file` is called and afterwards we send our newly generated jobscript to slurm.

```bash
name=run_file

make_run_file ${name}
sbatch ${name}.sh
```

If you want a deeper tutorial on shell scripts, then take a look [https://www.shellscript.sh/](here).

Exercises
---
1. Add comments using `#` to the shell script such that you comfortably understand the code.
2. Run the script and check that it works as intended.
3. Change the script such that e.g. the memory and time limits are passed as arguments to `make_run_file`.

    ```answer
    make_run_file() {
    cat > $1.sh <<%EOF%
    #!/bin/bash
    #SBATCH --job-name=$1
    #SBATCH --output="out.txt"
    #SBATCH --error="err.txt"
    #SBATCH --time=$2
    #SBATCH --mem=$3

    make
    ./main.exe
    %EOF%
    }

    name=run_file

    make_run_file ${name} 00:00:30 1M
    sbatch ${name}.sh
    ```