# Technically the multiprocessing library does implement shared memory parallelism,
# but one can allocate CPU-cores to the job in slurm as if it did.
from multiprocessing import Pool
from time import sleep

def hello(i):
    sleep(1)
    print(f"Starting thread {i}")
    sleep(1)
    print(f"Hello World from thread {i}")
    sleep(1)
    print(f"Finished thread {i}")

if __name__ == '__main__':
    n = 2
    with Pool(n) as p:
        p.map(hello, range(n))
