class Card
    attr_reader :card_value
    attr_accessor :face_down

    def initialize(value, face_down = true)
        @card_value = value
        @face_down = face_down
    end

    def hide
        @face_down = true
    end

    def reveal
        @face_down = false
    end

    # def to_s(card)
    #     card.to_s
    # end

    def ===(card)
        self.card_value === card.card_value
    end

end
