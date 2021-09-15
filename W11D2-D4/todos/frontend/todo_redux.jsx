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
    const preloadedState = {
        todos: {
            1: {id:1 ,title:"todo_a", body:"did a", completed: true}, 
            2: {id:2 ,title:"todo_b", body:"will do b", completed: false}
        }
    };
    const store = configureStore(preloadedState);

    window.todoAction = receiveTodo;
    window.todosAction = receiveTodos;
    window.todoremoveAction = removeTodo;
    window.stepsAction = receiveSteps;
    window.stepAction = receiveStep;
    window.stepremoveAction = removeStep;
    window.store = store;
    window.allTodos = allTodos;

    // <Root /> fix dis on Wednesday
    ReactDOM.render(<Root store={store} />, document.getElementById("root"));
})
