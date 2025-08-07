module AccountErrors

  class OpenedAccountError < ArgumentError

    def initialize(message = 'Account already opened: Cannot open an opened account')
      super
    end

  end

  class UnopenedAccountError < ArgumentError

    def initialize(message = 'Account not opened: Account must be opened for this action')
      super
    end

  end

  class DepositAmountError < ArgumentError

    def initialize(message = 'Deposit amount must be positive')
      super
    end

  end

  class WithdrawalAmountError < ArgumentError

    def initialize(message = 'Withdrawal amount must be positive')
      super
    end

  end

  class InsufficientFundsError < ArgumentError

    def initialize(message = 'Withdrawal amount must not exceed account balance')
      super
    end

  end

end

class BankAccount
  include AccountErrors

  private

  def initialize
    self.status = :closed
  end

  def validate_deposit(amount = 0)
    raise UnopenedAccountError unless opened?
    raise DepositAmountError unless amount.positive?
  end

  def validate_withdrawal(amount = 0)
    raise UnopenedAccountError unless opened?
    raise WithdrawalAmountError unless amount.positive?
    raise InsufficientFundsError if amount > balance_amount
  end

  def opened?
    status == :opened
  end

  def closed?
    status == :closed
  end

  public

  attr_accessor :balance_amount, :status

  def balance
    raise UnopenedAccountError if closed?

    balance_amount
  end

  def open
    raise OpenedAccountError if opened?

    self.status = :opened
    self.balance_amount = 0
  end

  def close
    raise UnopenedAccountError unless opened?

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
