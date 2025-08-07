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

    n1 = numbers[0]
    operators.each_with_index do |operator, i|
      n2 = numbers[i + 1]
      action = SIGNS[operator]
      n1 = n1.public_send(action, n2)
    end

    n1
  end
end
