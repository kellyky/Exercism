export const toRoman = (num) => {
//  console.log("\n" + "Number entered: " + num); 
  let romanNumeral = []; 
  
  let repeatThisManyTimes = (num - (num % 1000)) / 1000; 
  romanNumeral.push('M'.repeat(repeatThisManyTimes)); 
  let leftoverNumber = num % 1000; 
  
  if (leftoverNumber >= 900 && leftoverNumber < 1000) {
    romanNumeral.push('CM'); 
    leftoverNumber -= 900;
  }   
  if (leftoverNumber >= 500 && leftoverNumber < 1000) {
    romanNumeral.push('D');
  }   
  leftoverNumber %= 500;
  if (leftoverNumber >= 400 && leftoverNumber < 500) {
    romanNumeral.push('CD');
    leftoverNumber -= 400;
  }   
  repeatThisManyTimes = (leftoverNumber - (leftoverNumber % 100)) / 100;
  romanNumeral.push('C'.repeat(repeatThisManyTimes)); 
  leftoverNumber %= 100;
  
  if (leftoverNumber >= 90 && leftoverNumber < 100) {
    romanNumeral.push('XC'); 
    leftoverNumber -= 90; 
  }   
  
  if (leftoverNumber >= 50 && leftoverNumber < 100) {
    romanNumeral.push('L');
  }
  leftoverNumber %= 50; 
  if (leftoverNumber >= 40 && leftoverNumber < 50) {
    romanNumeral.push('XL');
    leftoverNumber -= 40; 
  }   
  repeatThisManyTimes = (leftoverNumber - (leftoverNumber % 10)) / 10; 
  romanNumeral.push('X'.repeat(repeatThisManyTimes)); 
  leftoverNumber %= 10; 
  
  if (leftoverNumber == 9) {
    romanNumeral.push('IX');
    leftoverNumber -= 9;
  }   
  if (leftoverNumber >= 5 && leftoverNumber < 10) {
    romanNumeral.push('V');
  }
  leftoverNumber %= 5;
  if (leftoverNumber == 4) {
    romanNumeral.push('IV');
    leftoverNumber -= 4;
  }   
  repeatThisManyTimes = (leftoverNumber - (leftoverNumber % 1)) / 1;
  romanNumeral.push('I'.repeat(repeatThisManyTimes)); 
  
  return romanNumeral.join('');;
}