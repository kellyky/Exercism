module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    RANKS.include?(rank.to_i) && FILES.include?(file)
  end

  def self.nick_name(first_name, last_name)
    NickName.create(first_name, last_name)
  end

  def self.move_message(first_name, last_name, square)
    file, rank = square.split('')
    player = self.nick_name(first_name, last_name)

    if self.valid_square?(rank, file)
      "#{player} moved to #{square}"
    else
      "#{player} attempted to move to #{square}, but that is not a valid square"
    end
  end

  class NickName
    def self.create(first_name, last_name)
      new(first_name, last_name).create
    end

    def initialize(first_name, last_name)
      @first_name = first_name.upcase
      @last_name = last_name.upcase
    end

    def create
      @first_name[0...2] + @last_name[@last_name.size - 2..-1]
    end
  end
end
