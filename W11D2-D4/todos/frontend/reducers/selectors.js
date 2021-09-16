export function allTodos(state) {
  return {
    todos: Object.values(state.todos)
  }
}

export function stepsByTodoId(state, todoId) {
  let stepsObj = Object.values(state.steps);  // = [{id:, title:, done:, todo_id: }, {id:, title:, done:, todo_id: }]
  let results = [];
  for(let i=0; i<stepsObj.length; i++){
    if(stepsObj[i].todo_id === todoId){
      results.push(stepsObj[i]);
    }
  }
  return results;
}
