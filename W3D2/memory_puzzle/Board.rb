require_relative "card"
require "byebug"

class Board

    attr_reader :grid, :card_value
    attr_accessor :face_down

    def initialize(num)
        raise "error" if num % 2 != 0
        @grid = Array.new(num) { Array.new(num) }
    end

    def card_deck
        num = self.grid.length
        squared = (num ** 2)
        arr = []
        while arr.length < squared
            letter = ('a'..'z').to_a.sample
            new_card1 = Card.new(letter)
            new_card2 = Card.new(letter)
            # p new_card.card_value
            if !arr.include?(new_card1)
                arr << new_card1
                arr << new_card2
            end
        end
        arr
    end


    def populate
        # self.card_deck.each do |card|
        #     row = rand(0...self.grid.length)
        #     col = rand(0...self.grid.length)
        #     if @grid[row][col] == nil
        #         @grid[row][col] = card
        #     end
        # end
        # @grid

        shuffled = self.card_deck.shuffle
        (0...self.grid.length).each do |row|
            (0...self.grid.length).each do |col|
                last = shuffled.pop
                @grid[row][col] = last
            end
        end
    end

    def render
        # debugger
        rendered = Array.new(@grid.length){Array.new(@grid.length)}
        @grid.each_with_index do |subarr,i|
            subarr.each_with_index do |ele,k|
                if ele.face_down == false
                    rendered[i][k] = ele.card_value
                else
                    rendered[i][k] = "_"
                end
            end
        end

        rendered.each do |subarr| 
            print subarr
            print "\n"
        end
    end

    def won?
        self.grid.flatten.each do |ele|
            if ele.face_down == true
                return false
            end
        end
        p "Winner"
        return true
    end

    def reveal(guess)
        row, col = guess
        if self.grid[row][col].face_down == true
            self.grid[row][col].face_down = false
        end
    end

end

b1 = Board.new(4)
b1.card_deck
b1.populate
p "reveal [0,0]-> facedown is now  #{b1.reveal([0,0])}"
p "reveal [1,1]-> facedown is now  #{b1.reveal([1,1])}"
p "reveal [2,2]-> facedown is now  #{b1.reveal([2,2])}"
p "reveal [3,3]-> facedown is now  #{b1.reveal([3,3])}"
b1.render
p "player won? #{b1.won?}"

