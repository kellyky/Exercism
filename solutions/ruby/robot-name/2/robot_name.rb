class Robot
  # attr_reader :name
  @@available_names = ('AA000'..'ZZ999').to_a.shuffle
  # @@used_names = []

  def self.forget
    @@available_names = ('AA000'..'ZZ999').to_a.shuffle
    # @@used_names.each { |name| @@available_names << @@used_names.pop }
  end

  def initialize
    name
    # add_name_to_used_names
  end

  def name
    @name ||= @@available_names.pop
  end

  # def add_name_to_used_names
  #   @@used_names << @name
  # end

  def reset
    @name = nil
  end
end
