#include<mpi.h>
#include<stdio.h>
#include<stdbool.h>

int main (int argc, char *argv[])
{
    int i, rank, size, namelen;
    char name [MPI_MAX_PROCESSOR_NAME];

    MPI_Init (&argc, &argv);

    MPI_Comm_size (MPI_COMM_WORLD, &size);
    MPI_Comm_rank (MPI_COMM_WORLD, &rank);
    MPI_Get_processor_name (name, &namelen);

    printf ("Hello World from rank %d running on %s!\n", rank, name);

    if (rank == 0 )
       printf ("MPI World size = %d processes\n", size);

    long long j = 0;
    while (true) {
        j++;
    }
    printf("%d", j);

    MPI_Finalize ();
}
