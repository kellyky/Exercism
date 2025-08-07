class PhoneNumber
  VALID_PHONE_NUMBER = /^(1)?([2-9]){1}([0-9]){2}[2-9]([0-9]){6}$/

  def self.clean(phone_number)
    digits = phone_number.scan(/\d+/).join
    if digits.match?(VALID_PHONE_NUMBER)
      digits.length == 10 ? digits : digits[1..-1]
    end
  end
end
