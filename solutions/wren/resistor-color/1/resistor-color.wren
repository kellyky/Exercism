var COLORS = [
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white"
]

class Resistor {
  static colorCode(color) {
    for (i in 0..COLORS.count - 1){
      if (COLORS[i] == color) {
        return i
      }
    }
  }
}
