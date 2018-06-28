class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    @execute_transaction ||= begin
    if @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
    end
   end

   def reverse_transfer
     if self.execute_transaction == 'complete'
       @sender.balance += @amount
       @receiver.balance -= @amount
       @status = 'reversed'
     end
   end

end
