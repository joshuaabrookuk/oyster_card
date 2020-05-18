# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

class Oystercard

  attr_reader :balance, :in_use

  LIMIT = 90

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
    raise "Maximum balance is £#{LIMIT}, current balance is £#{@balance}" if @balance + value > LIMIT

    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_use
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

end
