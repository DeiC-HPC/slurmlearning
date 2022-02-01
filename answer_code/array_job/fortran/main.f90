program hello
   implicit none
   
   character(100) :: job_num
   character(100) :: arr_len
   character(100) :: output
   
   IF(COMMAND_ARGUMENT_COUNT().NE.2)THEN
      WRITE(*,*)'ERROR, TWO COMMAND-LINE ARGUMENTS REQUIRED, STOPPING'
      STOP
   ENDIF

   CALL GET_COMMAND_ARGUMENT(1,job_num)
   CALL GET_COMMAND_ARGUMENT(2,arr_len)

   output = "Hello World from job number " // trim(job_num) // " of " // trim(arr_len)
   
!   write(*, fmt="(X)", advance='no') "Hello World from job number ", job_num, " of ", arr_len
   print *, output
   
end program
