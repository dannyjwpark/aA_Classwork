require_relative "card"
require_relative "board"

class Game
    attr_accessor :board, :guessed, :guessed_pos

    def initialize(num, guessed=nil)
        @board = Board.new(num)
        @guessed = nil
        @guessed_pos = Array.new(2)
        self.board.card_deck
        self.board.populate
    end

    def play
        while self.board.won? == false
            self.board.render
            p "Take a guess in format '1,1'"
            guess = gets.chomp.split(',')
            pos = guess.map { |ele| ele.to_i }
            if self.guessed == nil
                self.board.reveal(pos)
                self.guessed = self.board.grid[pos[0]][pos[1]]
                self.guessed_pos = pos
            #  no need to compare guessed.card_value  vs  grid[pos][pos].card_value  b/c == def compares the card_values of the cards
            elsif self.guessed === self.board.grid[pos[0]][pos[1]]
                self.guessed.face_down = false
                self.board.grid[pos[0]][pos[1]].face_down = false
                self.guessed = nil
                guessed_pos = [nil,nil]
            elsif guessed_pos == pos
                self.guessed.face_down = true
                guessed_pos = [nil,nil]
            elsif self.guessed.card_value != self.board.grid[pos[0]][pos[1]].card_value
                self.guessed.face_down = true
                self.board.grid[pos[0]][pos[1]].face_down = true
                self.guessed = nil
                guessed_pos = [nil,nil]
            end
        end
    end

end

# game_1 = Game.new(4)
# game_1.play
