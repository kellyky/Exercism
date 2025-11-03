class Sieve

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
    calculate
  end

  def prime?(marked)
    marked.nil?
  end

  def multiple(num, multiplier)
    num * multiplier
  end

  def calculate
    self.primes = [] if number < 2

    numbers.map do |num, marked|
      if prime?(marked)
        2.upto(number) do |multiplier|
          next if multiple(num, multiplier) > number

          numbers[multiplier * num] = :not_prime
        end
      end
    end

    self.primes = numbers.select{ |num, marked| marked.nil? }.keys
  end

  public

  attr_reader :primes

end
