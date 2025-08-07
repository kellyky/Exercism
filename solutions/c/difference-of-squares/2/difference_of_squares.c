#include "difference_of_squares.h"
#include <stdio.h>

int square_of_sum(int n) {
  int sum = n * (n + 1) / 2;
  return sum * sum;
}

int sum_of_squares(int n) {
  int sum_of_squares = n * (n + 1) * (2 * n + 1) / 6;
  return sum_of_squares;
}

int difference_of_squares(int n) {
  return square_of_sum(n) - sum_of_squares(n);
}
