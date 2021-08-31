const View = require("../src/ttt-view.js");  // require appropriate file
const Game = require("../ttt_node/game.js");  // require appropriate file

// window.View = View;
// window.Game = Game;

document.addEventListener("DOMContentLoaded", () => {
  // find the container element in the view created in dist/index.html
  // const ttt = document.querySelector(".ttt");
  const ttt = document.querySelectorAll(".ttt")[0];
  const game = new Game();
  // const view = new View(game, ttt);
  console.log(ttt);
  new View(game, ttt);
});
