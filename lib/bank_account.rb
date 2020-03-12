require 'pry'
class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end 
    def deposit(num)
        @balance += num
    end
    def display_balance
        "Your balance is $#{self.balance}."
    end
    def valid?
        if self.status == "open" && self.balance > 0
            true
        else self.status == "closed"
            false
        end 
    end
    def close_account 
        self.status = "closed"
    end 
end
# binding.pry
# @closed = BankAccount.new("steph")
# @closed.status = "closed"