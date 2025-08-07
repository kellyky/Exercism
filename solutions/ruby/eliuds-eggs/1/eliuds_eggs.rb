class EliudsEggs
  def self.egg_count(eggs)
    new(eggs).decode
  end

  def decode
    ledger = 0

    while eggs > 0
      quotient, remainder = eggs.divmod(2)
      ledger += remainder
      self.eggs = quotient
    end

    ledger
  end

  private

  attr_accessor :eggs

  def initialize(eggs)
    self.eggs = eggs
  end
end
