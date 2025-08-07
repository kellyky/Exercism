#include "difference_of_squares.h"
#include "math.h"
#include <stdio.h>

int square_of_sum(int n) {
  int iteratedNumbers[n];
  int sum = 0;
  
  int i = 1;
  while (i <= n){
    sum += i;
    iteratedNumbers[i - 1] = i;
    i++;
  }

  return pow(sum, 2);
}

int sum_of_squares(int n) {
  int iteratedNumbers[n];

  int i = 1;
  while (i <= n){
    iteratedNumbers[i - 1] = i;
    i++;
  }

  int sum_of_squares = 0;

  for(i = 0; i < n; i++){
    int base = iteratedNumbers[i];
    int exponent = 2;
    int result = pow(base, exponent);
    sum_of_squares += result;
  }

  return sum_of_squares;
}

int difference_of_squares(int n) {
  return square_of_sum(n) - sum_of_squares(n);
}
