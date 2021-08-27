Function.prototype.inherits = function(parent){
    function Surrogate(){};
    Surrogate.prototype = parent.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

function MovingObject(type) { 
    this.type = type;
}
MovingObject.prototype.moveit = function () {
    console.log(`Move!`);
}



function Ship(name, type) { 
    //////
    MovingObject.call(this, type);
    //////
    this.name = name;
}
Ship.inherits(MovingObject);

Ship.prototype.printType = function(){
    console.log(`${this.type} `);
}

function Asteroid(size, type) { 
    MovingObject.call(this, type);
    this.size = size;
}
Asteroid.inherits(MovingObject);





let m1 = new MovingObject ("thing");
let s1 = new Ship ("Moby dick");
let a1 = new Asteroid ("big");


s1.printType();
console.log(s1.name);
console.log(s1.type);   // "thing"