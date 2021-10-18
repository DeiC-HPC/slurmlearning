from mpi4py import MPI
from multiprocessing import Pool
from time import sleep

comm = MPI.COMM_WORLD
rank = comm.Get_rank()

def hello(i):
    thread = 2*rank+i
    sleep(rank/2)
    print(f"Starting thread {thread}")
    sleep(rank+.75)
    print(f"Hello World from thread {thread} of process {rank}")
    sleep(2-rank)
    print(f"Finished thread {thread}")

n = 2
with Pool(n) as p:
    p.map(hello, range(n))
