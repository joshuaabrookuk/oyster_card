require 'oystercard'

describe Oystercard do
  let(:oystercard) {Oystercard.new}
  it 'Should have an Oystercard class' do
    expect(Oystercard).to respond_to(:new)
  end

  describe '#balance' do
    it 'Should initialize a new a balance of 0' do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'Should top up balance with value passed' do
      oystercard.top_up(20)
      expect(oystercard.balance).to eq(20)
    end

    it 'Should raise an error when new balance will be above 90' do
      expect { oystercard.top_up(100) }.to raise_error("Maximum balance is £#{Oystercard::LIMIT}, current balance is £#{@balance.to_i}")
    end
  end
end
