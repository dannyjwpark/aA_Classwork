# @pokemons.each do |pokemon|
#   json.set! pokemon.id do 
#     json.partial! 'pokemon', pokemon: pokemon
#   end
# end


@pokemons.each do |poke|
  json.set! poke.id do
    json.extract! poke, :id, :name
    json.image_url asset_path("pokemon_snaps/#{poke.image_url}")
  end
end