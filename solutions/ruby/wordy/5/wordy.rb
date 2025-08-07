class WordProblem
  private

  OPERATORS = /plus|minus|divided|multiplied/
  OPERATOR = {
    'plus'       => '+',
    'minus'      => '-',
    'multiplied' => '*',
    'divided'    => '/'
  }

  attr_accessor :word_problem, :numbers, :operators

  def initialize(word_problem)
    self.word_problem = word_problem
    self.numbers = word_problem.scan(/-?\d+/).map(&:to_i)
    self.operators = word_problem.scan(OPERATORS)
  end

  def valid?
    !operators.empty? &&
      numbers.size == operators.size + 1
  end

  public

  def answer
    raise ArgumentError unless valid?

    operators.each_with_index.reduce(numbers[0]) do |total, (sign, i)|
      math_operator = OPERATOR[sign]
      total.public_send(math_operator, numbers[i + 1])
    end
  end
end
