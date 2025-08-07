const HOURS = 8;  // hours in workday
const DAYS  = 22; // billable days in month

export const dayRate = (ratePerHour) => HOURS * ratePerHour;

export const daysInBudget = (budget, ratePerHour) => Math.floor(budget / dayRate(ratePerHour));

export const priceWithMonthlyDiscount = (ratePerHour, numDays, discount) => {
  const fullMonths = Math.floor(numDays / DAYS);

  // billable days by rate
  const daysMonthlyRate = fullMonths * DAYS;
  const daysDailyRate   = numDays - daysMonthlyRate;

  // billable rates
  const dailyRate   = dayRate(ratePerHour);
  const monthlyRate = dayRate(ratePerHour * (1 - discount));

  return Math.ceil(daysMonthlyRate * monthlyRate + daysDailyRate * dailyRate);
}
