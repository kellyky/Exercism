require 'pry-byebug'

class Robot
  @@names = []
  @@robots_instantiated = 0

  def self.forget
    @@names = []
    @@robots_instatiated = 0
  end

  def initialize
    @name = nil
    @@robots_instantiated += 1
  end

  def reset
    @name = nil
  end

  def name
    compile_name

    if @@robots_instantiated > @@names.count
      if @@names.include?(@name)
        reassign_name
      end
    end

    @@names << @name
    @name
  end

  def reassign_name
    reset
    compile_name
  end

  def compile_name
    @name ||= letter + letter + digits
  end

  def letter
    (65 + rand(25)).chr
  end

  def digits
    rand(0..999).to_s.rjust(3, '0')
  end
end
