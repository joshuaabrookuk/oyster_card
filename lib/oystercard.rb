class Oystercard


  attr_reader :balance, :journeys

  LIMIT = 90
  LOW = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(value)
    message = "Maximum balance is £#{LIMIT}, current balance is £#{@balance}"
    raise message if balance_check_over?(value)

    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    return false if @journeys == []
    (@journeys[-1][:entry_station].nil? || @journeys[-1][:exit_station].nil?)
  end

  def touch_in(station)
    message = "Insufficient funds, current balance £#{@balance}. Minimum balance to travel £#{LOW}"
    raise message if @balance < LOW
    @journeys << {entry_station: station}

  end

  def touch_out(station)
    @journeys[-1][:exit_station] = station
    deduct(LOW)
  end

  private

  def balance_check_over?(value)
    @balance + value > LIMIT
  end

end
