class BankAccount

  ACCOUNT_MUST_BE_OPENED = 'Account not opened: Account must be opened'
  CANNOT_CHECK_BALANCE_CLOSED_ACCOUNT = 'Account closed: Cannot check balance of closed account'
  ACCOUNT_ALREADY_OPENED = 'Account opened: Cannot open an opened account'
  DEPOSIT_AMOUNT_MUST_BE_POSITIVE = 'Deposit amount must be positive'
  WITHDRAWAL_AMOUNT_MUST_BE_POSITIVE = 'Withdrawal amount must be positive'
  WITHDRAWAL_MUST_NOT_EXCEED_BALANCE = 'Withdrawal must not exceed balance'

  private

  def initialize
    self.status = :closed
  end

  def validate_deposit(amount = 0)
    raise ArgumentError, ACCOUNT_MUST_BE_OPENED unless opened?
    raise ArgumentError, DEPOSIT_AMOUNT_MUST_BE_POSITIVE unless amount.positive?
  end

  def validate_withdrawal(amount = 0)
    raise ArgumentError, ACCOUNT_MUST_BE_OPENED unless opened?
    raise ArgumentError, WITHDRAWAL_AMOUNT_MUST_BE_POSITIVE if amount.negative?
    raise ArgumentError, WITHDRAWAL_MUST_NOT_EXCEED_BALANCE if amount > balance_amount
  end

  def opened?
    status == :opened
  end

  public

  attr_accessor :balance_amount, :status

  def balance
    raise ArgumentError, CANNOT_CHECK_BALANCE_CLOSED_ACCOUNT if status == :closed

    balance_amount
  end

  def open
    raise ArgumentError, ACCOUNT_ALREADY_OPENED if opened?

    self.status = :opened
    self.balance_amount = 0
  end

  def close
    raise ArgumentError, ACCOUNT_MUST_BE_OPENED unless opened?

    self.balance_amount = 0
    self.status = :closed
  end

  def deposit(amount)
    validate_deposit(amount)

    self.balance_amount += amount
  end

  def withdraw(amount)
    validate_withdrawal(amount)

    self.balance_amount -= amount
  end

end

