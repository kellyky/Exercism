
export const score = (x, y) => {
  let radius = (( x ** 2) + ( y ** 2)) ** (0.5);
  return (radius <= 1) ? 10 
    : (radius > 1 && radius <= 5) ? 5  
    : (radius > 5 && radius <= 10) ? 1
    : 0;
}



