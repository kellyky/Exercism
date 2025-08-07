class Robot
  @@available_names = ('AA000'..'ZZ999').to_a.shuffle

  def self.forget
    @@available_names = ('AA000'..'ZZ999').to_a.shuffle
  end

  def initialize
    new_name
  end

  def new_name
    @name ||= @@available_names.pop
  end

  def reset
    @name = nil
  end
end
