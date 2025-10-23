# Module name: Conjured
# - Defines 'conjured' category
module Conjured
  extend self

  CONJURED = /conjured/i

  def conjured?
    name.match?(CONJURED)
  end

end
