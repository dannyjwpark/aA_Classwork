json.partial! 'guest', guest: @guest

json.gifts do 
    @guest.gifts.each do |gift|
        json.set! gift.id do 
            json.extract! gift, :id, :title, :description, :guest_id
        end
    end
end