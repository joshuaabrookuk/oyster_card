class Oystercard

  attr_reader :balance, :in_use

  LIMIT = 90
  LOW = 1

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
    raise "Insufficient funds, current balance £#{@balance}. Minimum balance to travel £#{LOW}" if @balance < LOW

    @in_use = true
  end

  def touch_out
    @in_use = false
  end

end
