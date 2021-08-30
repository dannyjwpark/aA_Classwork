
// 2D position.
// 2D velocity.
// radius(everything in the game is a circle).
// color
class MovingObject {
    constructor(pos, vel, radius, color){
        this.pos = pos;
        this.vel = vel;
        this.radius = radius;
        this.color = color;
    }
}

module.exports = MovingObject;


const mo = new MovingObject({
    pos: [30, 30],
    vel: [10, 10],
    radius: 5,
    color: "#00FF00"
});