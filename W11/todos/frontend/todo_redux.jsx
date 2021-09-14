import React from "react"
import ReactDOM from "react-dom"
import configureStore from "./store/store";
import {receiveTodo, receiveTodos, removeTodo} from "./actions/todo_actions";
import { receiveSteps, receiveStep, removeStep } from "./actions/step_actions";


document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore();
    window.todoAction = receiveTodo;
    window.todosAction = receiveTodos;
    window.todoremoveAction = removeTodo;
    window.stepsAction = receiveSteps;
    window.stepAction = receiveStep;
    window.stepremoveAction = removeStep;
    window.store = store;
    ReactDOM.render(<h1>Todos App</h1>, document.getElementById("root"))
})
