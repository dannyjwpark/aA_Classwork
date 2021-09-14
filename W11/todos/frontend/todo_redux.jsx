import React from "react"
import ReactDOM from "react-dom"
import configureStore from "./store/store";
import {receiveTodo} from "./actions/todo_actions";


document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore();
    window.todoAction = receiveTodo;
    window.store = store;
    ReactDOM.render(<h1>Todos App</h1>, document.getElementById("root"))
})
