program hello
    USE omp_lib
    implicit none
    include 'mpif.h'
    
    integer :: ierr, rank, num_proc, num_thread!, thread
    
    call MPI_INIT(ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD, num_proc, ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)

    !$OMP PARALLEL private(num_thread, thread)
    !    thread = 2*rank + num_thread

        call sleep(num_thread+1)
        print *, "Starting process ", num_thread
        call sleep(1)
        print *, "Hello World from thread ", num_thread, " on process ", rank
        call sleep(1)
        print *, "Finished process ", num_thread
    !$OMP END PARALLEL
    call MPI_FINALIZE(ierr)
end program
