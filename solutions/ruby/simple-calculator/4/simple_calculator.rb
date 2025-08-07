require 'pry-byebug'

class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    operators = [first_operand, second_operand]
    raise ArgumentError unless operators.all? { |op| op.is_a? Integer }
    raise SimpleCalculator::UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)

    begin
      "#{first_operand} #{operation} #{second_operand} = #{first_operand.send(operation, second_operand)}"
    rescue => e
      'Division by zero is not allowed.'
    end
  end

  class UnsupportedOperation < StandardError
  end
end
