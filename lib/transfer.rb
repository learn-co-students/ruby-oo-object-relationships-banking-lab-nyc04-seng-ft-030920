class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  # your code here

      def initialize(sender, receiver, amount)
        @status ='pending'
        @sender = sender
        @receiver = receiver 
        @amount = amount
      end

      def valid?
        sender.valid? == receiver.valid?
      end

      def execute_transaction
        if valid? && sender.balance > amount && self.status == 'pending'
          sender.balance -= amount
          receiver.balance += amount
          self.status = "complete"
        else
          rejected_transfer
        end
      end

      def reverse_transfer
        if valid? && sender.balance > amount && self.status == 'complete'
          sender.balance += amount
          receiver.balance -= amount
          self.status = "reversed"
        else
          rejected_transfer
        end
      end

      def rejected_transfer
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
end

