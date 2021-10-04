#include<iostream>

int main(){
	std::cout << "Hello World!" << std::endl;
	int n = 8000;
	std::cout << "Initializing matrix of " << n << "x" << n << " doubles" << std::endl;
	double** matrix;
	matrix = new double*[n];
	for(int i=0; i<n; i++) matrix[i] = new double[n];
	std::cout << "Initialization complete" << std::endl;
	std::cout << "Clearing memory" << std::endl;
	for(int i=0; i<n; i++){
                delete[] matrix[i];
        }// for
        delete[] matrix;
	std::cout << "Program finished" << std::endl;
}//main
