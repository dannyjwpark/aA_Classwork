class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.handleClick();
    this.setupBoard();
    // this.bindEvents();
  }

setupBoard() {
    const ul = document.createElement("ul");
    for(let i = 0; i < 3; i++){
      for(let j = 0; j < 3; j++){
        const li = document.createElement("li");
        li.dataset.index = [i, j];
        ul.appendChild(li);
      }
    }
    this.el.append(ul);
  }
  
  
  bindEvents() {}

  handleClick(e) {}

  makeMove(square) {}

}




module.exports = View;
