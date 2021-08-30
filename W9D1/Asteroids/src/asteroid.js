const MovingObject = require("./moving_object")
const Util = require("./util")

function Asteroid(options) {
    MovingObject(options.pos, DEFAULTS.COLOR, DEFAULTS.RADIUS, Util.randomVec(10));
};

Util.inherits(Asteroid, MovingObject);

const DEFAULTS = {    
    COLOR: "#ede85f",
    RADIUS: 25,
    VEL: 4
}

const testA = new Asteroid({ pos: [30, 30] });