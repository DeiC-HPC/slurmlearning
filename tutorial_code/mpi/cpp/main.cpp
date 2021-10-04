#include<iostream>
#include<mpi.h>
#include<unistd.h>

int main(){
	int rank;
	int num_proc;
	
	MPI_Init(NULL, NULL);
	MPI_Comm_size(MPI_COMM_WORLD, &num_proc);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	sleep(rank/2.);
	std::cout << "Starting process " << rank << std::endl;
	sleep(1);
	std::cout << "Hello World from process " << rank << " of " << num_proc-1 << std::endl;
	sleep(1);
	std::cout << "Finishing process " << rank << std::endl;

	MPI_Finalize();
	return 0;
}//main
