#include "grains.h"

uint64_t square(uint8_t index){
  uint8_t i = 1;
  uint64_t grains = 1;

  if (index == 0) return 0;
  if (i == index) return grains;

  while (i < index) {
    grains *= 2;
    i++;
  }

  return grains;  
}

uint64_t total(void){
  // starts with square 1 values
  uint8_t i = 1;
  uint64_t grain_sum = 1;

  uint64_t grains = 1; 
    while (i < 64) {
    grains *= 2;
    grain_sum += grains;
    i++;
  }

  return grain_sum;
}
