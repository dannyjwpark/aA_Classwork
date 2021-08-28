export default class Level extends FlappyBird{
  
  constructor(dimensions) {
    this.dimensions = dimensions;
  }

  // const mybird = document.getElementById("bird-game");
  // const ctx = mybird.getContext("");

  //The Level class, its constructor receives 
    // the dimensions from the Game class and stores them
  drawBackground(ctx) {
    ctx.fillStyle = "skyblue";
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
  }


}