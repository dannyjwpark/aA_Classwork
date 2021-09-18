import React from "react";
import ReactDOM  from "react-dom";
import {receiveAllPokemon} from "./actions/pokemon_actions"
import {fetchAllPokemon} from "./util/api_util"

document.addEventListener("DOMContentLoaded",()=>{
  const root = document.getElementById("root")  

  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;

  console.log("React is working");
  ReactDOM.render(<h1>Pokedex</h1>,root);
  
})
