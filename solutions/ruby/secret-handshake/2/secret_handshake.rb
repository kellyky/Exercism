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
  end

  def commands
    actions = []

    i = 4
    while i >= 0
      if @binary_number[i] == '1'
        if i == 0
          actions.reverse!
        else
          actions << INDEX_ACTIONS[i]
        end
      end
      i -=1
    end

    actions
  end

  def binary_number
    return '00000' if @num > 31

    @num.to_s(2).rjust(5, '0')
  rescue
    '00000'
  end
end
