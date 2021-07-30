require_relative "piece.rb"
class Board


    def initialize
        @null_piece = NullPiece.instance
        # @piece = Piece.new
        # @piece = Piece.new(:P)
        @grid = Array.new(8){Array.new(8,@null_piece)}

        # @rows = Array.new(8,NullPiece.instance)
        # private
        
    end

    def populate
        (0...@grid.length).each do |i|
            if [0,1,6,7].include?(i)
                (0...@grid.length).each do |j|
                    @grid[i][j] = Piece.new(:P)
                end
            end
        end
    end

    #  rendering with copying on board to another 2d array
    def render
        string = ""
        @grid.each do |row|
            string += row.map {|tile| tile.value}.join(" ") + "\n"
        end

        return string
        
        # board_render = Array.new(8){Array.new(8)}

        # @grid.each_with_index do |i,row|
        #     i.each_with_index do |k,col|
        #         board_render[row][col] = @grid[row][col].value
        #     end
        # end

        # board_render.each do |row|
        #     p row.join (" ")
        # end
    end

    def [](pos)
        row,col = pos
        @grid[row][col]
    end

    def []=(pos,val)
        row,col = pos
        @grid[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        # raise error if the board instance @ starting pos doesn't have the piece on it
        raise "Error: no piece @ starting position" if self[start_pos] == @null_piece

        raise "Error: piece already at ending position" if self[end_pos] == @piece

        moving_piece = self[start_pos]
       
        self[end_pos] = moving_piece

        self[start_pos] = @null_piece
    end

end


b = Board.new

p b.populate

puts b.render

b.move_piece([1,0], [2,0])

puts

puts b.render

