Run files
---

It is often advantageous to use a bash script to generate and run ones Slurm script.
For the user unfamiliar with shell scripting a brief introduction is in place &mdash; otherwise feel free to skip this part.

Please navigate to the directory `~/run_file/` where you will find the Hello World program from `~/hello_world/cpp/`, a Makefile and shell script called `run_file`.
Notice that lines 3-11 are essentially just an expanded version of the `slurmscript.sh` from `~/hello_world/cpp/`.
The basic structure of a shell script is that one defines variables using the syntax

```bash
<var_name>=<var_val>
```

and functions as

```bash
<func_name>() {<func body here>}
```

The function body can span multiple lines.
Variables are then referenced as `${<var_name>}`, but in most cases the brackets can be omitted, whereas functions are called as `<func_name>`.
Arguments are passed to functions as

```bash
<func_name> $arg1 $arg2 ...
```

and referenced inside the function body in order of appearence as `$1`, `$2`, etc.

Lastly line 2 of the code, `cat > $1.sh <<%EOF%` uses the shell command `cat` to redirect all lines until `%EOF%` into a file named `$1.sh`.

Once a shell script has been completed it can be run as `./<script_name>`

Exercises
---
1. Add comments to the shell script such that you comfortably understand the code.
2. Run the script and check that it works as intended.
3. Change the script such that e.g. the memory and time limits are passed as arguments to `make_run_file`.