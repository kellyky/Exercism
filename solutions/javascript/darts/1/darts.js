export const score = (x, y) => {
  let radius = (( x ** 2) + ( y ** 2)) ** (0.5);  
  if (radius <= 1) {
    return 10;
  } else if (radius > 1 && radius <= 5) {
    return 5;
  } else if (radius > 5 && radius <= 10) {
    return 1;    
  } else {
    return 0;
  }
}
