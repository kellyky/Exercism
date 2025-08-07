class IsbnVerifier
  # (d₁ * 10 + d₂ * 9 + d₃ * 8 + d₄ * 7 + d₅ * 6 + d₆ * 5 + d₇ * 4 + d₈ * 3 + d₉ * 2 + d₁₀ * 1) mod 11 == 0
  
  def self.valid?(string)
    new(string).valid?
  end

  def initialize(string)
    @string = string
    @digits = scrubbed_digits
  end

  def valid?
    return false if @string.empty?
    return false unless @string[-1].match?(/\d|X/)
    return false if @string[0...-1].match?(/[A-Za-z]/)

    @digits << check_digit

    return false unless @digits.length == 10
    
    sum = 0
    x = 10
    @digits.each do |digit|
      sum += (digit * x)
      x -= 1
    end

    sum % 11 == 0
  end

  def check_digit
    @string[-1] == 'X' ? 10 : @string[-1].to_i
  end

  def scrubbed_digits
    @string[0...-1].scan(/\d/).map(&:to_i)
  end
end