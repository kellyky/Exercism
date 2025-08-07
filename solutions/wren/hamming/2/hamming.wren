class Hamming {
  static compute(first, second) {
    if (first.count != second.count) { 
      Fiber.abort("strands must be of equal length")
    }
    
    var differences = 0

    for (i in 0...first.count){
      if (first[i] != second[i]){
        differences = differences + 1
      }
    }
    return differences
  }
}
