#include<iostream>
#include<omp.h>
#include<unistd.h>

int main(){
#pragma omp parallel
{
	int num_thread = omp_get_thread_num();
	// Sleeping a different amout of time for each thread to avoid writing at the same time
	sleep(num_thread);
	std::cout << "Starting thread " << num_thread << std::endl;
	// Sleeping a different amout of time for each thread to avoid writing at the same time
	sleep(1.1);
	std::cout << "Hello World from thread " << num_thread
			<< " of " << omp_get_num_threads()-1 << std::endl;
	sleep(1);
	std::cout << "Finished thread " << num_thread << std::endl;
}//omp parallel
}//main
