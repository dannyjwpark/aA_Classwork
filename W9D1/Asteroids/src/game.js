const Asteroid = require("./asteroid")

function Game() {
    this.asteroids = [];
    this.addAsteroids();
}

const DEFAULTS = {    
    DIM_X: 1000,
    DIM_Y: 600,
    NUM_ASTEROIDS: 10
}

Game.prototype.addAsteroids = function() {
    for(let i = 0; i < DEFAULTS.NUM_ASTEROIDS; i++) {
        let astie = new Asteroid(this.randomPosition());
        this.asteroids.push(astie);
    }
}

Game.prototype.randomPosition = function() {
    return [Math.floor(Math.random() * DEFAULTS.DIM_X),
        Math.floor(Math.random() * DEFAULTS.DIM_Y)]//an array
}

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0,0,DEFAULTS.DIM_X, DEFAULTS.DIM_Y);
    for(let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].draw(ctx)
    }
}

Game.prototype.moveObjects = function () {
    console.log(this.asteroids, " this is the asteroids array")
    for(let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].move()
    }
}

module.exports = Game;