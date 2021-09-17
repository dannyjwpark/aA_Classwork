import * as APIUtil from '../util/todo_api_util'
export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos,
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo,
  };
};


export const removeTodo = (todo) => {
  return {
    type: REMOVE_TODO,
    todo: todo
  }
}

export const fetchTodos = () => dispatch => {
  return APIUtil.fetchTodos()
    .then(response => dispatch(receiveTodos(response)));
}

// export const fetchAllTeas = () => dispatch => {
//   return TeaApiUtil.getTeas()
//     .then(teas => dispatch(receiveAllTeas(teas)));
// };
