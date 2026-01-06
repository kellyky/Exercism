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

  public

  def include?
    digits.sum { |digit| digit.to_i ** power } == number
  end

end
