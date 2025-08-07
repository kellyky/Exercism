#include <stdio.h>
#include "binary_search.h"

const int *binary_search(int value, const int *arr, size_t length){
  if (length == 0){
     printf("Empty array segment\n");
     return NULL;
  }
  size_t middle = length / 2;
  int middle_element = arr[middle];

  printf("binary_search called with value: %d, arr: %p, length: %zu, middle: %zu, middle_element: %d\n", 
         value, (void*)arr, length, middle, middle_element);

  if (value < middle_element) return binary_search(value, arr, middle); 
  if (value > middle_element)  {
    printf("Recursive call with value: %d, arr: %p, length: %zu\n", 
           value, (void*)(arr + middle + 1), length - middle - 1);
    return binary_search(value, arr + middle + 1, length - middle - 1);
  }
  if (value == middle_element) return &arr[middle];
  return NULL;
}
