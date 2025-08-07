class BankAccount

  ACCOUNT_MUST_BE_OPENED = 'Account must be opened'
  DEPOSIT_AMOUNT_MUST_BE_POSITIVE = 'Deposit amount must be positive'
  WITHDRAWAL_AMOUNT_MUST_BE_POSITIVE = 'Withdrawal amount must be positive'
  WITHDRAWAL_MUST_NOT_EXCEED_BALANCE = 'Withdrawal must not exceed balance'


  private

  def validate_deposit(amount = 0)
    raise ArgumentError, ACCOUNT_MUST_BE_OPENED unless opened
    raise ArgumentError, DEPOSIT_AMOUNT_MUST_BE_POSITIVE unless amount.positive?
  end

  def validate_withdrawal(amount = 0)
    raise ArgumentError, ACCOUNT_MUST_BE_OPENED unless opened
    raise ArgumentError, WITHDRAWAL_AMOUNT_MUST_BE_POSITIVE if amount.negative?
    raise ArgumentError, WITHDRAWAL_MUST_NOT_EXCEED_BALANCE if amount > balance_amount
  end

  public

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
    validate_deposit(amount)

    self.balance_amount += amount
  end

  def withdraw(amount)
    validate_withdrawal(amount)

    self.balance_amount -= amount
  end

  def close
    raise ArgumentError unless opened

    self.balance_amount = 0
    self.closed = true
    self.opened = false
  end
end
