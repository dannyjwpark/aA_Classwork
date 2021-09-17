import {RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO} from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};
export const todosReducer = (oldState=initialState, action) => {
  Object.freeze(oldState);
  const newState = Object.assign({}, oldState);
  switch (action.type) {
    case RECEIVE_TODO:
      newState[action.todo.id] = action.todo;
      return newState;

    case RECEIVE_TODOS:
      for(const property in action.todos){
        // if buggy, revisit here
        newState[action.todos[property].id] = action.todos[property];
        // ***
      }
    return newState;
    
    case REMOVE_TODO:
      delete newState[action.todo.id];
      return newState;

    default:
      return newState;
  }
};

export default todosReducer;


// testing
// store.dispatch(toremoveAction({ id: 1 }))


