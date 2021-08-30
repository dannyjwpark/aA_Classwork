const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;

console.log("Webpack is working!");


document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById("game-canvas");
    canvas.getContext("2d");
});
