import React from "react"
import ReactDOM from "react-dom"
import { Provider } from "react-redux";
import configureStore from "./store/store";
import {receiveTodo, receiveTodos, removeTodo} from "./actions/todo_actions";
import { receiveSteps, receiveStep, removeStep } from "./actions/step_actions";
import App from "./components/app";
import Root from "./components/root"; 
import {allTodos} from "./reducers/selectors";


document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore();
    window.todoAction = receiveTodo;
    window.todosAction = receiveTodos;
    window.todoremoveAction = removeTodo;
    window.stepsAction = receiveSteps;
    window.stepAction = receiveStep;
    window.stepremoveAction = removeStep;
    window.store = store;
    window.allTodos = allTodos;
    // <Root /> fix dis on Wednesday
    ReactDOM.render(<Provider store={store}><App /></Provider>, document.getElementById("root"))
})
