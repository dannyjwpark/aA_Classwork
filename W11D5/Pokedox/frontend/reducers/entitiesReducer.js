import pokemonReducer from './pokemon_reducer';
// import itemsReducer from '';

import { combineReducers } from 'redux';

const entitiesReducer = combineReducers({
    pokemon: pokemonReducer,
})

export default entitiesReducer;