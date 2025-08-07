class SecretHandshake
  INDEX_ACTIONS = {
    1 => 'jump',
    2 => 'close your eyes',
    3 => 'double blink',
    4 => 'wink'
  }

  def initialize(num)
    @num = num
    @binary_number = binary_number
    @actions = []
  end

  def commands
    4.downto(0).each { |index| handle_digit(index) }
    @actions
  end

  private

  def handle_digit(index)
    return unless handshake_action?(index)

    if reverse?(index)
      @actions.reverse!
    else
      @actions << INDEX_ACTIONS[index]
    end
  end

  def reverse?(index)
    index == 0
  end

  def handshake_action?(index)
    @binary_number[index] == '1'
  end

  def binary_number
    return '00000' unless (integer? && valid_range?)

    @num.to_s(2).rjust(5, '0')
  end

  def integer?
    @num.is_a?(Integer)
  end

  def valid_range?
    @num <= 31 && @num >= 0
  end
end
