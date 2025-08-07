#include "collatz_conjecture.h"

int steps(int start){
  int number = start;
  int steps = 0;

  if (number <= 0) { return -1; }

  while (number > 1) {
    number = number % 2 == 0 ? number / 2 : number * 3 + 1;
    steps++;
  }

  return steps;
}
