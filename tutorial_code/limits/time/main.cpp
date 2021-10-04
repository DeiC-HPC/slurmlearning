#include<iostream>
#include<unistd.h>

int main(){
	std::cout << "Hello World!" << std::endl;
	int t = 120;
	std::cout << "Sleeping for " << t << " seconds" << std::endl;
	sleep(t);
	std::cout << "Finished sleeping" << std::endl;
}//main
