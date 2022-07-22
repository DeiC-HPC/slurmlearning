#include<iostream>

int main(){
	std::cout << "Hello World!" << std::endl;
	int n = 12000;
	std::cout << "Initializing matrix of " << n << "x" << n << " doubles" << std::endl;
	double* matrix;
	matrix = new double[n*n];
	for (int i = 0; i < n*n; i++) {
		matrix[i] = i/7;
	}
	std::cout << "Initialization complete" << std::endl;
	std::cout << "Clearing memory" << std::endl;
  delete matrix;
	std::cout << "Program finished" << std::endl;
}//main
