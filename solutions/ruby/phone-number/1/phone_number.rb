class PhoneNumber
  def self.clean(phone_number)
    new(phone_number).clean
  end

  def initialize(phone_number)
    @digits = phone_number.scan(/\d+/).join
  end

  def clean
    return unless valid_length? && valid_digits?
    @digits.length == 10 ? @digits : @digits[1..-1]
  end

  def valid_length?
    @digits.length == 10 || @digits.length == 11
  end

  def valid_digits?
    if @digits.length == 11
      return false unless @digits[0] == "1"
    end

    @digits[-7].match?(/[2-9]/) && @digits[-10].match?(/[2-9]/)
  end
end
