require "singleton"
require "colorize"

# puts "".blue

class Piece
attr_reader :value
    def initialize (value = :P)
        @color
        @board
        @pos
        @value = value

    end

    def to_s

    end


    def empty?

    end

    def moves
        
    end

    def valid_moves?(end_pos)
        row, col = end_pos

        return false if @grid[row][col].color == self.color
        return false if row > 7 || row < 0 || col > 7 || col < 0

        return true
    end



    def pos=(val)

    end

    def symbol

    end

    private
    def move_into_check?(end_pos)

    end


end


class NullPiece < Piece
    include Singleton

    attr_reader :color, :value
    def initialize
        super(:n)

    end

    # def moves

    # end


    # def symbol
        
    # end


end


################## subpieces

class Rook < Piece
    include 'Slideable'
    def initialize
        super
        
    end

    def symbol
    '♜'.colorize(color)
    end

    protected

    def move_dirs
        HORIZONTAL_AND_VERTICAL_DIRS = [
            [-1, 0],
            [0, -1],
            [0, 1],
            [1, 0]
          ]
    end
end

class Bishop < Piece
    def initialize
        super
    end

    def move_dirs
        DIAGONAL_DIRS = [
            [-1, -1],
            [-1, 1],
            [1, -1],
            [1, 1]
          ]
    end

    def symbol
    '♝'.colorize(color)
  end
end

class Queen < Piece
    def initialize
        super
    end

    def moves
        
    end

    def symbol
    '♛'.colorize(color)
  end
end

class Knight < Piece
    def initialize
        super
    end

    def moves
        
    end

    def symbol
    '♞'.colorize(color)
  end
end

class King < Piece
    def initialize
        super
    end

    def moves
        
    end

    def symbol
    '♚'.colorize(color)
  end
end

class Pawn < Piece
    def initialize
        super
    end

    def moves
        
    end

    def symbol
        '♟︎'.colorize(color)
    end
end






################## submodules

module Slideable
    
    def moves
        moves_array = []

        move_dirs.each do |x,y|
            moves_array += grow_unblocked_moves_in_dir(x,y)
        end

        moves_array
    end

    private 
    def grow_unblocked_moves_in_dir(dx,dy)
        grown_moves = []

        row, col = pos

        while true
            #iterate to find all new positions that are valid
        iterate on new_pos = [row + dx, col + dy] 
            if valid_moves?(new_pos)
                grown_moves << new_pos
            elsif
            if taking enemy?
        #break when
            #trying to move to tile AFTER taking enemy piece
            #out of bound
            #ally piece


        grown_moves
    end

    self[pos]
    start_row, start_col = pos

    vertical_moves = []

    (0..7).each do |row|
        vertical_moves << [row, start_col] unless [row, start_col] == [start_row, start_col]
    end
   
    horizontal_moves = []

    (0..7).each do |col|
        horizontal_moves << [start_row, col] unless [start_row, col] == [start_row, start_col]
    end

    horizontal_dirs = vertical_moves + horizontal_moves

    left_to_right_down_diag = []

    right_to_left_down_diag = []

    ()

    diagonal_dirs = 
end




module Stepable


end