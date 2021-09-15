import React from "react"
import TodoListItem from "./todo_list_item"

export default (props) => (
    <div>
        <h2>Todo List goes here!</h2>
        <ul>
            {props.todos.map((todo, idx) => {
                <li key={idx} >
                    {todo.title}
                </li>
            })}
        </ul>
    </div>
)