import _ from 'lodash';

function component() {
    const element = document.createElement('div');

    // Lodash, now imported by this script
    element.innerHTML = _.join(['Webpack', 'is', 'working!'], ' ');

    return element;
}

document.body.appendChild(component());

const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;
