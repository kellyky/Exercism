#include "leap.h"

bool divisible_by_four(int year){
  return year % 4 == 0;
}

bool divisible_by_one_hundred(int year){
  return year % 100 == 0;
}

bool divisible_by_four_hundred(int year){
  return year % 400 == 0;
}

bool leap_year(int year){
  if (divisible_by_one_hundred(year)){
    return divisible_by_four_hundred(year);
  }
  return divisible_by_four(year);
}
