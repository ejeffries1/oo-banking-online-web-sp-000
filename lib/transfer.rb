class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # your code here

  def initialize(sender, receiver, amount, status = "pending")
    @status = status
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    @status = "rejected" if @sender.balance < @amount
      if @sender.balance > @amount
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "complete"
      else
        return "transaction rejected."
      end
  end
end
