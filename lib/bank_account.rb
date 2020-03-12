class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
    end

    def deposit(deposit_amount)
        self.balance += deposit_amount
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def valid?
        balance > 0 and self.status == "open"
       
        # if self.status=="open" and balance > 0
        #     true
    end

    def close_account
        self.status = "closed"
    end

end
