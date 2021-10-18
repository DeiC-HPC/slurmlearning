#include <stdlib.h>
#include <stdio.h>
#include <unistd.h> /* for gethostname */
#include <mpi.h>   /* Special mpi header */
#include <omp.h>

/* 
 * Some preprocessor magic
 */
#define xstr(s) str(s)
#define str(s) #s

#if defined __INTEL_COMPILER
   #define COMPILER intel-__INTEL_COMPILER
#elif defined __clang__
   #define COMPILER clang-__clang_major__.__clang_minor__.__clang_patchlevel__
#elif defined __GNUC__
   #define COMPILER gcc-__GNUC__.__GNUC_MINOR__.__GNUC_PATCHLEVEL__
#elif defined __PGI
   #define COMPILER pgi-__PGIC__.__PGIC_MINOR__.__PGIC_PATCHLEVEL__
#endif

/* 
 * Actual program
 */
int main()
{
    /* Initialize MPI */
    MPI_Init(NULL, NULL);
    
    /* Get our rank */
    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
 
    /* Get hostname */
    char hostname[512];
    gethostname(hostname, 512);
    
    /* Print "Hello" */
    #pragma omp parallel
    {
        int num_thread = omp_get_thread_num();
       
        printf("Starting thread %i of process %i on node %s\n", num_thread, rank, hostname);
        sleep(1);
        printf("Hello World from thread %i of process %i on node %s.\n",
           num_thread, rank, hostname);
        sleep(1);
        printf("Finished thread %i of process %i on node %s\n", num_thread, rank, hostname);
    }
    /* Finalize MPI */
    MPI_Finalize();
 
    return 0;
}
