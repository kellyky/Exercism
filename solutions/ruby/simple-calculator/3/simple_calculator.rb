class SimpleCalculator         
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  
  def self.calculate(first_operand, second_operand, operation)
    operators = [first_operand, second_operand] 
    raise ArgumentError unless operators.all? { |op| op.is_a? Integer }
    raise SimpleCalculator::UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)

    begin
      result = case operation
       when '+'
         first_operand + second_operand
       when '/'
        first_operand / second_operand
       when '*'
         first_operand * second_operand
       end
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue => e
      'Division by zero is not allowed.'
    end
  end

  class UnsupportedOperation < StandardError
  end
end