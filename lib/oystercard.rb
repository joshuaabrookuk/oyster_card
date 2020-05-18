# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

class Oystercard

  attr_reader :balance

  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise "Maximum balance is £#{LIMIT}, current balance is £#{@balance}" if @balance + value > LIMIT

    @balance += value
  end

end
