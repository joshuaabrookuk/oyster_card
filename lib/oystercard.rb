class Oystercard

  attr_reader :balance, :entry_station, :exit_station

  LIMIT = 90
  LOW = 1

  def initialize
    @balance = 0

  end

  def top_up(value)
    raise "Maximum balance is £#{LIMIT}, current balance is £#{@balance}" if balance_check_over?(value)

    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_in(station)
    raise "Insufficient funds, current balance £#{@balance}. Minimum balance to travel £#{LOW}" if @balance < LOW
    @entry_station = station

  end

  def touch_out(station)
    @exit_station = station
    deduct(LOW)
    @entry_station = nil
  end

  private

  def balance_check_over?(value)
    @balance + value > LIMIT
  end

end
