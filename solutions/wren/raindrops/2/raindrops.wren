class Raindrops {
  static convert(n) {
    var droplets = ""

    var divisible_by_three = false
    var divisible_by_five = false
    var divisible_by_seven = false
    
    if (n % 3 == 0){
      droplets = droplets + "Pling"
      divisible_by_three = true
    }

    if (n % 5 == 0){
      droplets = droplets + "Plang"
      divisible_by_five = true
    }

    if (n % 7 == 0){
      droplets = droplets + "Plong"
      divisible_by_seven = true
    }

    if (!divisible_by_three && !divisible_by_five && !divisible_by_seven) {
      droplets = droplets + n.toString
    }
    
    return droplets
  }

  
}
