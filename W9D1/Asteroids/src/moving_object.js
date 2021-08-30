// 2D position.
// 2D velocity.
// radius(everything in the game is a circle).
// color
// class MovingObject {
//     constructor(pos, vel, radius, color){
//         this.pos = pos;
//         this.vel = vel;
//         this.radius = radius;
//         this.color = color;
//     }
// }

function MovingObject(pos, vel, radius, color){
    this.pos = pos;
    this.vel = vel;
    this.radius = radius;
    this.color = color;
}

MovingObject.prototype.draw = function(ctx){
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true);
    ctx.fill();
}

MovingObject.prototype.move = function(){
    this.pos ++;
    this.vel ++;
}

module.exports = MovingObject;

const mo = new MovingObject({
    pos: [30, 30],
    vel: [10, 10],
    radius: 5,
    color: "#00FF00"
});

