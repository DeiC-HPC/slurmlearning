#include <iostream>
#include <unistd.h>
#include <mpi.h>
#include <omp.h>

int main()
{
    MPI_Init(NULL, NULL);
    
    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
 
    #pragma omp parallel
    {
        int num_thread = omp_get_thread_num();
       
        sleep(num_thread+1);
        std::cout << "Starting thread " << num_thread  <<
                  " on process " << rank << std::endl;
        sleep(1);
        std::cout << "Hello World from thread " << num_thread <<
                  " on process " << rank << std::endl;
        sleep(1);
        std::cout << "Finished thread " << num_thread <<
                  " on process " << rank <<std::endl;
    }
    MPI_Finalize();
 
    return 0;
}
