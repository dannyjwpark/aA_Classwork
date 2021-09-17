json.set! "pokemon" do 
  json.set! @pokemon.id do
    json.extract! @pokemon, :id, :name,:attack,:defense,:poke_type,:image_url
  end
end

json.set! "moves" do 
  @pokemon.moves.each_with_index do |move,idx|
    json.set! (idx+1) do
      json.extract! move, :id,:name
    end
  end
end

json.set! "items" do
  @pokemon.items.each do |item|
    json.set! item.id do
      json.extract! item, :id,:pokemon_id,:name,:price,:happiness,:image_url
    end
  end
end

