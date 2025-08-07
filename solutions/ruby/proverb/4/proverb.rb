class Proverb

  LINE_TEMPLATE = "For want of a %<cause>s the %<effect>s was lost.\n"
  FINAL_LINE_TEMPLATE = 'And all for the want of a %<root>s.'

  private_constant :LINE_TEMPLATE, :FINAL_LINE_TEMPLATE

  private

  attr_accessor :chain, :qualifier

  def initialize(*chain, qualifier: nil)
    self.chain = chain
    self.qualifier = qualifier
  end

  def final_pair?(i)
    !chain[i + 1]
  end

  def qualified_first_item
    if qualifier
      '%s %s' % [qualifier, chain.first]
    else
      chain.first
    end
  end

  def render_lyric(cause, i)
    if final_pair?(i)
      FINAL_LINE_TEMPLATE % { root: qualified_first_item }
    else
      LINE_TEMPLATE % { cause:, effect: chain[i + 1] }
    end
  end

  public

  def to_s
    chain.each_with_object(+'').with_index do |(cause, proverb), i|
      proverb << render_lyric(cause, i)
    end
  end

end
