class ArmstrongNumbers

  def self.include?(number)
    new(number).include?
  end

  private

  attr_accessor :digits,
                :number,
                :power

  def initialize(number)
    self.number = number
    self.digits = number.digits
    self.power  = digits.size
  end

  def powered_digits_sum
    digits.sum { |digit| digit ** power }
  end

  public

  def include?
    powered_digits_sum == number
  end

end
