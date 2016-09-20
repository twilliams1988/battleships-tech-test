require_relative 'ship'

class Game

BOARD = [
        [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
      ]



# test_board = [
#         [false,  false,  false,  false,  false,  nil,    nil,    nil,    nil,    nil],
#         [nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil],
#         [nil,    nil,    nil,    nil,    nil,    false,  nil,    nil,    nil,    nil],
#         [nil,    false,  false,  false,  nil,    false,  nil,    nil,    nil,    nil],
#         [nil,    nil,    nil,    nil,    nil,    false,  nil,    nil,    nil,    nil],
#         [nil,    nil,    nil,    nil,    nil,    false,  nil,    nil,    nil,    nil],
#         [nil,    false,  nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil],
#         [nil,    false,  nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil],
#         [nil,    false,  nil,    nil,    nil,    nil,    nil,    nil,    false,  nil],
#         [nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil,    false,  nil],
#       ]

attr_reader :board

  def initialize
    @ship = Ship.new
    @board = BOARD
  end


  def place_ship(ship, starting_coordinate, direction)
    ship_length = Ship::SHIPS[ship]
    if direction == :across
      ship_length.times do |i|
        @board[starting_coordinate[0].to_i][starting_coordinate[1].to_i + (i)] = ship
        i += 1
      end
    else
      ship_length.times do |i|
        @board[starting_coordinate[0].to_i + (i-1)][starting_coordinate[1].to_i] = ship
        i += 1
      end
    end
  end

end


=begin
Class of ship	  Size
Carrier	        5
Battleship	    4
Cruiser	        3
Submarine	      3
Destroyer	      2
=end
