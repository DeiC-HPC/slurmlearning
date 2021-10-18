#include<iostream>

int main(int nargs, char* vargs[]){
    int job_num = (int)*vargs[1] - (int)'0';
    int arr_len = (int)*vargs[2] - (int)'0';

    std::cout << "Hello World from job number " << job_num << " of " << arr_len << std::endl;

    return 0;
}//main
