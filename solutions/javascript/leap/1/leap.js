export function isLeap(year) {
  if (year % 4 !==0) {
    console.log("A common year");
  }
  else if (year % 4 === 0 && year % 100 !== 0){
    return "A leap year";
  }
  else if (year % 100 === 0 && year % 400 !== 0){
    console.log("A common year");
  }
  else if (year % 400 ===0){
    return "A leap year";
  }
  else if (year % 200 === 0 && year %400 !== 0){
    console.log("A common year");
  }




}
