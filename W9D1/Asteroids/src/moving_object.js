function MovingObject(options){
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
    this.game = options.game;
}

MovingObject.prototype.draw = function(ctx){
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true);
    ctx.fill();
}

MovingObject.prototype.move = function(){
    let keys = Object.keys(DIRS);

    // this.pos[0] += DIRS[keys[Math.floor(Math.random() * 3)]][0];
    // this.pos[1] += DIRS[keys[Math.floor(Math.random() * 3)]][1];
    this.pos[0] += DIRS[keys[Math.floor(Math.random() * 1)]][0];
    this.pos[1] += DIRS[keys[Math.floor(Math.random() * 1)]][1];

    // this.pos[0] ++;
    // this.pos[1] ++;
    this.vel[0] ++;
    this.vel[1] ++;
    this.pos = this.game.wrap(this.pos);
}

const DIRS = {
    // "w": [0, -1],
    // "a": [-1, 0],
    "s": [0, 1],
    "d": [1, 0],
};

MovingObject.prototype.isCollidedWith = function (otherObject) {
    // collision: when distance between their center points < the sum of their radii
    let x1 = this.pos[0];
    let y1 = this.pos[1];
    let x2 = otherObject.pos[0];
    let y2 = otherObject.pos[1];

    let distance = Math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2);
    let radSum = this.radius + otherObject.radius;

    if (distance < radSum) return true;
    return false;
}


MovingObject.prototype.collideWith = function (otherObject){
    this.remove(otherObject);
}



module.exports = MovingObject;

const mo = new MovingObject({
    pos: [30, 30],
    vel: [10, 10],
    radius: 5,
    color: "#00FF00"
});