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

  def place_ship(ship, starting_x_coordinate, starting_y_coordinate, direction)
    @ship_length = Ship::SHIPS[ship]
    placement_check(starting_x_coordinate, starting_y_coordinate, direction)
    if direction == :across
      # (@board[(starting_x_coordinate)..(starting_x_coordinate + @ship_length)]).include?(:CARRIER) ? (raise StandardError, 'You cannot place a ship on another ship.') : ship
      @ship_length.times do |i|
        @board[starting_x_coordinate][starting_y_coordinate + i] = ship
        i += 1
      end
    else
      @ship_length.times do |i|
        @board[starting_x_coordinate + i][starting_y_coordinate] = ship
        i += 1
      end
    end
  end

  def placement_check(starting_x_coordinate, starting_y_coordinate, direction)
    case direction
    when :across
      raise StandardError, 'You cannot place a ship that goes off the edge of the board.' if 10 - starting_x_coordinate < @ship_length
    when :down
      raise StandardError, 'You cannot place a ship that goes off the edge of the board.' if 10 - starting_y_coordinate < @ship_length
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
