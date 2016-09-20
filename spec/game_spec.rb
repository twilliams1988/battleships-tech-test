require_relative '../game'

describe Game do

  describe '#initialize' do
    it 'instantiates with a blank board of an array of arrays of nils' do
      expect(subject.board).to eq(Array.new(10, Array.new(10, nil)))
    end
  end

  describe '#place_ship' do
    it 'allows player to place a specific typr of ship on the board' do
      subject.place_ship(:CARRIER, "00", :across)
      expect(subject.board[0][0]).to eq(:CARRIER)
    end

    it 'allows player to specify the direction of the ship' do
      subject.place_ship(:CARRIER, "00", :across)
      expect(subject.board[0][0]).to eq(:CARRIER)
    end
  end

  describe '#placement_check' do
    it 'doesnt allow a user to place a ship that would go off the board' do
      expect{subject.place_ship(:CARRIER, "99", :across)}.to raise_error(StandardError)
    end

  end

end
