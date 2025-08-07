class EliudsEggs
  def self.egg_count(encoded_eggs)
    new(encoded_eggs).decode
  end

  def decode(eggs = encoded_eggs, ledger = 0)
    return ledger if eggs.zero?

    quotient, remainder = eggs.divmod(2)
    decode(quotient, ledger + remainder)
  end

  private

  attr_accessor :encoded_eggs

  def initialize(encoded_eggs)
    self.encoded_eggs = encoded_eggs
  end
end
