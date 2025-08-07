export const needsLicense = kind => {
  return kind === 'car' || kind === 'truck';
}

export const chooseVehicle = (vehicle1, vehicle2) =>  {
  const vehicle = vehicle1 < vehicle2 ? vehicle1 : vehicle2;
  return `${vehicle} is clearly the better choice.`;
}

export const calculateResellPrice = (originalPrice, age) => {
  const discount = age < 3 ? 0.8
    : age <= 10 ? 0.7
    : 0.5

  return originalPrice * discount;
}
