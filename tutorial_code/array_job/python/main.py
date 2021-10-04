from sys import argv
from time import ctime

if __name__ == "__main__":
    print(f'Job started at time {ctime()}')

    job_num = -1
    arr_len = -1

    for i in range(1,len(argv)):
        if argv[i][0:8] == 'job_num=': job_num = int(argv[i][8:])
        elif argv[i][0:8] == 'arr_len=': arr_len = int(argv[i][8:])
        else: print(f'Unrecognized input: {argv[i]}')

    print(f'Hello World from job number {job_num} of {arr_len}')
    
    print(f'Job finished at time {ctime()}')
