program hello
    USE omp_lib
    implicit none
    
    integer :: num_thread
    
    !$OMP PARALLEL private(num_thread)
        num_thread = omp_get_thread_num()
        call sleep(1)
        print *, "Starting thread ", num_thread
        call sleep(1)
        print *, "Hello World from thread ", num_thread
        call sleep(1)
        print *, "Finished thread ", num_thread
    !$OMP END PARALLEL
end program
