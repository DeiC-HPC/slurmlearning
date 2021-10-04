from mpi4py import MPI
from time import sleep

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
num_proc = comm.Get_size()

sleep(rank/2)
print(f"Starting process {rank}")
sleep(rank+.75)
print(f"Hello World from process {rank} out of {num_proc-1}")
sleep(2-rank)
print(f"Finished process {rank}")
