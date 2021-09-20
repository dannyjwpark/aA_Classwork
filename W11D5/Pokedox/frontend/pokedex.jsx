import React from "react";
import ReactDOM  from "react-dom";
import { receiveAllPokemon, requestAllPokemon } from "./actions/pokemon_actions"
import {fetchAllPokemon} from "./util/api_util"
import configureStore from './store/store.js'
import {selectAllPokemon} from './reducers/selectors'

document.addEventListener("DOMContentLoaded",()=>{
  const root = document.getElementById("root")  
  const store = configureStore();

  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch; 
  

  console.log("React is working");
  ReactDOM.render(<h1>Pokedex</h1>,root);
  
})
