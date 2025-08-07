class EliudsEggs
  def self.egg_count(eggs, ledger = 0)
    return ledger if eggs.zero?

    quotient, remainder = eggs.divmod(2)
    egg_count(quotient, ledger + remainder)
  end
end
