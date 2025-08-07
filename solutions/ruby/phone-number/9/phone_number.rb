module PhoneNumber
  PHONE_NUMBER = /^(1)?[2-9](\d){2}[2-9](\d){6}$/

  def self.clean(phone_number)
    digits = phone_number.scan(/\d+/).join
    return unless digits.match?(PHONE_NUMBER)
    digits.length == 10 ? digits : digits[1..-1]
  end
end

