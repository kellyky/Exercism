class SimpleCalculator         
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  
  def self.calculate(first_operand, second_operand, operation)
    operators = [first_operand, second_operand] 
    raise ArgumentError unless operators.all? { |op| op.is_a? Integer }
  
    result = case operation
             when '+'
               first_operand + second_operand
             when '/'
               if second_operand == 0        
                 return 'Division by zero is not allowed.'
               else
                 first_operand / second_operand
               end
             when '*'
               first_operand * second_operand
             else
               raise SimpleCalculator::UnsupportedOperation
             end

    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end

  class UnsupportedOperation < StandardError
  end
end