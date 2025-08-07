class BankAccount

  attr_accessor :balance_amount, :opened, :closed

  def open
    raise ArgumentError if opened

    self.closed = false
    self.opened = true
    self.balance_amount = 0
  end

  def balance
    raise ArgumentError if closed

    balance_amount
  end

  def deposit(amount)
    raise ArgumentError unless opened
    raise ArgumentError, "You can't deposit a negative amount" unless amount.positive?

    self.balance_amount += amount
  end

  def withdraw(amount)
    raise ArgumentError unless opened
    raise ArgumentError, "You can't withdraw more than you have" if amount > balance_amount
    raise ArgumentError, "You can't withdraw a negative amount" if amount.negative?

    self.balance_amount -= amount
  end

  def close
    raise ArgumentError unless opened

    self.balance_amount = 0
    self.closed = true
    self.opened = false
  end
end
