class Luhn
  def self.valid?(string)
    new(string).valid?
  end

  def initialize(string)
    @string = string.gsub(/\s+/, '')
    @digits = @string.chars.map(&:to_i)
  end

  def valid?
    return false unless digits_only? && @digits.size > 1

    multiply_every_second_digit.sum % 10 == 0
  end

  def multiply_every_second_digit
    @digits.reverse.map.with_index do |digit, index|
      index.odd? ? double_digit(digit) : digit
    end
  end

  def double_digit(digit)
    digit *= 2
    digit -= 9 if digit > 9
    digit
  end

  def digits_only?
    @string.match?(/^[\d]+$/)
  end
end
