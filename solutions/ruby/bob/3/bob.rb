class Bob
  REPLIES = {
    question: "Sure.",
    yelled_question: "Calm down, I know what I'm doing!",
    yelled: "Whoa, chill out!",
    silence: "Fine. Be that way!",
    other: "Whatever."
  }
  
  def self.hey(remark)
    type = Remark.new(remark).type
    REPLIES[type]
  end    
end

class Remark
  def initialize(remark)
    @remark = remark
  end

  def type
    return :silence if silence?
    return :yelled_question if yelled_question?
    return :yelled if yelled?
    return :question if question?
    :other
  end

  private
  
  def yelled?
    @remark.match?(/[A-Z]+/) && @remark == @remark.upcase
  end

  def question?
    @remark.strip.end_with?('?')
  end

  def yelled_question?
    yelled? && question?
  end

  def silence?
    @remark.strip.empty?
  end
end