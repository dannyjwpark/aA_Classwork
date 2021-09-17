json.array! @guests do |guest|
    # json.set! guest.id do
        json.partial! 'guest', guest: guest
    # end
end

