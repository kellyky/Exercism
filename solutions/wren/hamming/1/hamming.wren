class Hamming {
  static compute(first, second) {
    if (first.count != second.count) { 
      Fiber.abort("strands must be of equal length")
    }
    
    var differences = 0
    var i = 0
    while (i < first.count) {
      if (first[i] != second [i]){
        differences = differences + 1
      }
      i = i + 1
    }
 
    return differences
  }
}
