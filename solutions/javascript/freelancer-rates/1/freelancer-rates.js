// @ts-check

const HOURS_PER_DAY = 8;
const DAYS_IN_MONTH = 22;

export const dayRate = hourlyRate => hourlyRate * HOURS_PER_DAY;

export const daysInBudget = ((budget, hourlyRate) => {
  const day = dayRate(hourlyRate);
  return Math.floor(budget / day);
})

const monthlyRate = ((hourlyRate, discount) => {
  const monthlySubtotal = DAYS_IN_MONTH * dayRate(hourlyRate);
  const monthlyDiscount = monthlySubtotal * discount;
  return monthlySubtotal - monthlyDiscount;
})

const billableMonths = days => Math.floor(days / DAYS_IN_MONTH);

const daysSubtotal = ((days, rate) => dayRate(rate) * days);

export const priceWithMonthlyDiscount = ((hourlyRate, days, discount) => {

  const discountedMonthlySubtotal = billableMonths(days) * monthlyRate(hourlyRate, discount);

  const dailyRateDays = days % DAYS_IN_MONTH;
  const subtotal = discountedMonthlySubtotal + daysSubtotal(dailyRateDays, hourlyRate);

  return Math.ceil(subtotal);
})

