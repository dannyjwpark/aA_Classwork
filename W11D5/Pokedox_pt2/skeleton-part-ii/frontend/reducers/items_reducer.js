import { ,  } from './../actions/__';


const itemsReducer = (state = {}, action) => {
    Object.freeze(state);
    switch (action.type) {
        case ___: 
            return Object.assign({}, action.pokemon, state);
        default:
            return state;
    }
}


export default itemsReducer;