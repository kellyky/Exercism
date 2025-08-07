// @ts-check

const HOURS_PER_DAY = 8;
const DAYS_IN_MONTH = 22;

/**
 * Calculates the daily rate given an hourly rate.
 * @param {number} hourlyRate - The hourly rate.
 * @returns {number} The calculated daily rate.
 */
export const dayRate = hourlyRate => hourlyRate * HOURS_PER_DAY;

/**
 * Calculates how many full days fit within a given budget.
 * @param {number} budget - The total budget available.
 * @param {number} hourlyRate - The hourly rate.
 * @returns {number} The number of full working days within the budget.
 */
export const daysInBudget = (budget, hourlyRate) =>
  Math.floor(budget / dayRate(hourlyRate));

/**
 * Helper for priceWithMonthlyDiscount: Calculates number of full months from workdays
 * @param {number} days - The total number of days.
 * @returns {number} The number of full months.
 */
const months = days => Math.floor(days / DAYS_IN_MONTH);

/**
 * Helper for priceWithMonthlyDiscount: Calculates the monthly cost with a discount.
 * @param {number} hourlyRate - The hourly rate.
 * @param {number} discount - The discount as a decimal (e.g., 0.2 for 20%).
 * @returns {number} The total monthly cost after applying the discount.
 */
const monthlyCost = (hourlyRate, discount) => {
  const monthlyTotalCost = DAYS_IN_MONTH * dayRate(hourlyRate);
  const monthlyDiscount = monthlyTotalCost * discount;
  return monthlyTotalCost - monthlyDiscount;
}

/**
 * Calculates the total project cost based on an hourly rate,
 * applying a discount for full months and rounding up.
 * @param {number} hourlyRate - The hourly rate.
 * @param {number} days - The total number of billable days.
 * @param {number} discount - The discount as a decimal (e.g., 0.2 for 20%).
 * @returns {number} The final total cost, rounded up.
 */

export const priceWithMonthlyDiscount = (hourlyRate, days, discount) => {
  const discountedTotalCost = months(days) * monthlyCost(hourlyRate, discount);
  const remainingDays = days % DAYS_IN_MONTH;
  const totalCost = discountedTotalCost + remainingDays * dayRate(hourlyRate);
  return Math.ceil(totalCost);
}

