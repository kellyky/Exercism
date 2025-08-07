class IsbnVerifier
  def self.valid?(isbn_string)
    new(isbn_string).valid?
  end

  def initialize(isbn_string)
    @isbn_string = isbn_string
    @isbn_digits = scrubbed_isbn_digits
  end

  def valid?
    return false unless valid_format?

    adjusted_isbn_sum % 11 == 0
  end

  private

  def adjusted_isbn_sum
    @isbn_digits.each_with_index.sum do |digit, index|
      multiplier = 10 - index
      (digit * multiplier)
    end
  end

   def valid_check_digit?
    @isbn_string[-1].match?(/\d|X/)
  end

  def valid_isbn_body?
    !@isbn_string[0...-1].match?(/[A-Za-z]/)
  end

  def required_length?
    @isbn_digits.length == 10
  end
  
  def valid_format?
    !@isbn_string.empty? && valid_check_digit? && valid_isbn_body? && required_length?
  end

  def check_digit
    @isbn_string[-1] == 'X' ? 10 : @isbn_string[-1].to_i
  end

  def scrubbed_isbn_digits
    @isbn_string[0...-1].scan(/\d/).map(&:to_i) << check_digit
  end
end