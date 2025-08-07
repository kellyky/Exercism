class WordProblem
  private

  SIGNS = {
    'plus' => '+',
    'minus' => '-',
    'multiplied' => '*',
    'divided' => '/'
  }

  attr_accessor :word_problem, :numbers, :operators

  def initialize(word_problem)
    self.word_problem = word_problem
    self.numbers = word_problem.scan(/-?\d+/).map(&:to_i)
    self.operators = word_problem.scan(/plus|minus|divided|multiplied/)
  end

  def valid?
    !operators.empty? &&
      numbers.size == operators.size + 1
  end

  public

  def answer
    raise ArgumentError unless valid?

    operators.each_with_index.reduce(numbers[0]) do |memo, (operator, i)|
      memo.public_send(
        SIGNS[operator],
        numbers[i + 1]
      )
    end
  end
end
