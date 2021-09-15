export function allTodos(state) {
  return {
    todos: Object.values(state.todos)
  }
}