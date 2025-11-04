class Sieve

  SMALLEST_PRIME = 2

  NUMBERS = -> (number) do
    (2..number).each_with_object({}) do |number, numbers|
      numbers[number] = nil
    end
  end

  private

  private_constant :NUMBERS

  attr_accessor :number, :numbers, :primes

  def initialize(number)
    self.number  = number
    self.numbers = NUMBERS[number]
    mark_primes
  end

  def prime?(marked)
    marked.nil?
  end

  def mark(num, marked)
    SMALLEST_PRIME.upto(number) do |multiplier|
      multiple = num * multiplier
      return unless multiple <= number

      numbers[multiple] = :not_prime
    end
  end

  def mark_primes
    numbers.map { |num, marked| mark(num, marked) }
  end

  public

  def primes
    numbers.select{ |_, marked| marked.nil? }.keys
  end

end
