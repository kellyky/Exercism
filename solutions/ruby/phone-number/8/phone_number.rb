class PhoneNumber
  PHONE_NUMBER = /^(1)?[2-9](\d){2}[2-9](\d){6}$/

  def self.clean(phone_number)
    new(phone_number).clean
  end

  def initialize(phone_number)
    @digits = phone_number.scan(/\d+/).join
  end

  def clean
    return unless @digits.match?(PHONE_NUMBER)
    @digits.length == 10 ? @digits : @digits[1..-1]
  end
end

