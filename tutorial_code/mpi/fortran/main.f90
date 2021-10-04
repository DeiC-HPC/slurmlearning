program hello
    implicit none
    include 'mpif.h'
    
    integer :: ierr, rank, num_proc
    
    call MPI_INIT(ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD, num_proc, ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
    call sleep(1)
    print *, "Starting process ", rank
    call sleep(1)
    print *, "Hello World from process ", rank, " of ", num_proc-1
    call sleep(1)
    print *, "Finished process ", rank
    call MPI_FINALIZE(ierr)
end program
