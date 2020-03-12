require 'pry'
require_relative './bank_account'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # Transfer.new(amanda, avi, 50) passing
  # Transfer.new(amanda, avi, 4000) failing
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    sender.valid? && receiver.valid?
  end 
  def execute_transaction
    if valid? && @status == "pending" && sender.balance > @amount
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      reject_transfer
    end 
  end 
  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end 

  def reverse_transfer
    if valid? && @status == "complete" && receiver.balance > @amount
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end
end
# binding.pry