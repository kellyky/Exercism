const AGE_OLDEST = 10
const AGE_NEWISH = 3
const DISCOUNT_OLDEST   = 0.5
const DISCOUNT_MODERATE = 0.3
const DISCOUNT_NEWISH   = 0.2

export const needsLicense = (kind) => kind === 'car' || kind === 'truck';

export const chooseVehicle = (option1, option2) => {
  const vehicle = option1 < option2 ? option1 : option2;
  return `${vehicle} is clearly the better choice.`;
}

const calculateDiscount = (age) => {
   return age > AGE_OLDEST ? DISCOUNT_OLDEST
     : age >= AGE_NEWISH ? DISCOUNT_MODERATE
     : DISCOUNT_NEWISH;
}

export const calculateResellPrice = (originalPrice, age) => {
  const discount = 1 - calculateDiscount(age);
  return originalPrice * discount;
}
