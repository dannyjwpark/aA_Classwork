import {RECEIVE_TODO, RECEIVE_TODOS} from "../actions/todo_actions";



export const todosReducer = (oldState, action) => {
  Object.freeze(oldState);
  const newState = Object.assign({}, oldState);
  switch (action.type) {
    case RECEIVE_TODO:
      newState[action.todo.id] = action.todo;
      return newState;
    case RECEIVE_TODOS:
      newState[action.todos.id] = action.todos;
      return newState;
    default:
      return newState;
  }
};

export default todosReducer;