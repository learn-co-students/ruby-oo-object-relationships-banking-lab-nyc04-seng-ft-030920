require 'pry'
class Transfer

  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    @status == "complete" ? return : nil
    @sender.balance -= @amount
    @receiver.balance += @amount
    if !valid?
      @status = "rejected"
      @sender.balance += @amount
      @receiver.balance -= @amount
      return "Transaction rejected. Please check your account balance." 
    end
    @status = "complete"
  end

  def reverse_transfer
    if status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
