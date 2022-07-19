from time import ctime
import argparse

if __name__ == "__main__":

    print(f'Job started at time {ctime()}')

    parser = argparse.ArgumentParser()
    parser.add_argument("--job_num", type=int, help="Job number")
    parser.add_argument("--arr_len", type=int, help="Array length")

    args = parser.parse_args()

    job_num = args.job_num
    arr_len = args.arr_len

    print(f'Hello World from job number {job_num} of {arr_len}')

    print(f'Job finished at time {ctime()}')
