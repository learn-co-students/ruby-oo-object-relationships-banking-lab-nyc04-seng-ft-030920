require "pry"
require_relative  'bank_account'

class Transfer
  attr_reader :sender , :receiver, :amount
  attr_accessor :status
    def initialize(sender, receiver, amount)
      @sender  = sender
      @receiver = receiver 
      @status = "pending"
      @amount = amount
    end 
    def valid?
      (sender.valid? && receiver.valid?) ? true : false
    end

    def execute_transaction
      return if status != "pending"
      if sender.balance >= amount && valid?
        sender.deposit(-amount.to_i)
        receiver.deposit(amount.to_i)
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      return if status != "complete"
      sender.deposit(amount.to_i)
      receiver.deposit(-amount.to_i)
      @status = "reversed"
    end

end
