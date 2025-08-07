module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    power = digits.size
    digits.sum { |digit| digit.to_i ** power } == number
  end
end
