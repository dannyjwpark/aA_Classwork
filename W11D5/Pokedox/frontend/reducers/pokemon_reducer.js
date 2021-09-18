import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions'

export const pokemonReducer = (state={}, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);

    switch(action.type){
        case RECEIVE_ALL_POKEMON:
            return {...state, ...action.pokemon}
        // case case RECEIVE_POKEMON:
        //     return 
        default:
            return state;
    }
}