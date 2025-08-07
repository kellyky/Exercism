const HOURS = 8; // hours in workday
const DAYS = 22; // billable days in month

export const dayRate = (ratePerHour) => {
  return HOURS * ratePerHour;
}

export const daysInBudget = (budget, ratePerHour) => {
  return Math.floor(budget / dayRate(ratePerHour));
}

export const priceWithMonthlyDiscount = (ratePerHour, numDays, discount) => {
  const fullMonths = Math.floor(numDays / DAYS);

  // billable days by rate
  const daysAtMonthlyRate = fullMonths * DAYS;
  const daysAtDailyRate = numDays - daysAtMonthlyRate;

  // billable rates
  const dailyRate = dayRate(ratePerHour);
  const monthlyRate = dayRate(ratePerHour * (1 - discount));

  return Math.ceil(daysAtMonthlyRate * monthlyRate + daysAtDailyRate * dailyRate);
}
