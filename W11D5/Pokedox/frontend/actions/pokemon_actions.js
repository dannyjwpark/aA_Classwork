// frontend/actions/pokemon_actions.js
import * as APIUtil from '../util/api_util'

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';

// action
export const receiveAllPokemon = pokemon => ({
    type: RECEIVE_ALL_POKEMON,
    pokemon // received @ reducer case
})

// actinobuilder
export const requestAllPokemon = () => (dispatch) => (
    APIUtil.fetchAllPokemon()
        // calling action "receiveAllPokemon"; hence, actionbuilder
        .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)