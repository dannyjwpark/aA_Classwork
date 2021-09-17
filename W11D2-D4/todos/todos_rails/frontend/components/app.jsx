import React from "react"
import TodoList from "./todos/todo_list"
import TodoListContainer from "./todos/todo_list_container"


export default class App extends React.Component {
  constructor(props){super(props)}

  render() {
    return (
        <div><TodoListContainer /></div>
    )
    
  }
}