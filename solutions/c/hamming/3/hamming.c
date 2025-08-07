#include "hamming.h"
#include <string.h>

int compute(const char *lhs, const char *rhs){
  int length_lhs = strlen(lhs);
  int length_rhs = strlen(rhs);
  int differences = 0;

  // if (length_lhs != length_rhs) {
  if (length_lhs != length_rhs) {
    return -1;
  } else {
    int i = 0;
    for( i = 0; i < length_lhs; i++){
      if(lhs[i] != rhs[i]){
        differences++;
      }
    }
  }
  return differences;
}
