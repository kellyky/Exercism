class Raindrops {
  static convert(n) {
    var droplets = ""

    if (n % 3 == 0){
      droplets = droplets + "Pling"
    }

    if (n % 5 == 0){
      droplets = droplets + "Plang"
    }

    if (n % 7 == 0){
      droplets = droplets + "Plong"
    }

    if (n % 3 != 0 && n % 5 != 0 && n % 7 != 0) {
      droplets = droplets + "%(n)"
    }
    
    return droplets
  }

  
}
