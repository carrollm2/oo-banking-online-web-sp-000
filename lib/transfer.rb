require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)

    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end


  def valid?
    @sender.valid? && @receiver.valid?
  end


  def execute_transaction

    # if self.valid? && @status == "pending" && @sender.balance > self.amount
    #   @receiver.deposit(self.amount)
    #   @sender.deposit(-self.amount)
    #   @status = "complete"
    #   binding.pry
    # else
    #   @status = "rejected"
    #   "Transaction rejected. Please check your account balance."
    # end
    if valid? && sender.balance > amount && self.status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
    else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(-self.amount)
      @sender.deposit(self.amount)
      @status = "reversed"
    end
  end
end
