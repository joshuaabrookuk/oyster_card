require 'oystercard'

describe Oystercard do
  it 'Should have an Oystercard class' do
    expect(Oystercard).to respond_to(:new)
  end

  describe '#balance' do
    it 'Should initialize a new a balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end
end
