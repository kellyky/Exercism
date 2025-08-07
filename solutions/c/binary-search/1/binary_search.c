#include "binary_search.h"

const int *binary_search(int value, const int *arr, size_t length){
  size_t middle = length / 2;
  int middle_element = arr[middle];

  if (value < middle_element) return binary_search(value, arr, middle); 
  if (value > middle_element) return binary_search(value, arr + middle + 1, middle - 1);
  if (value == middle_element) return &arr[middle];
  return NULL;
}
