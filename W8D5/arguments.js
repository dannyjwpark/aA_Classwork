// SUM
function sum(...args){
    return args.reduce((acc, el) => acc + el);
    // return Array.from(args).reduce((acc,el) => acc+el );
    // return Array.prototype.slice.apply(arguments).reduce((acc, el) => acc + el);
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

/////////////////////////////////////////////////////////
// bind with args

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

// with arguments keyword
// Function.prototype.myBind = function(ctx){
//     const that = this;
//     const arr = Array.from(arguments).slice(1);
//     // console.log("this is the arg array:" + arr);
//     return function(){
//         let callArgs = Array.from(arguments);
//         // console.log("this is the callArgs:" + callArgs);
//         return that.apply(ctx, arr.concat(callArgs));
//     }
// }

// with ... rest operator
Function.prototype.myBind = function(ctx, ...args){
    const that = this;
    return function(...callArgs){
        return that.apply(ctx, args.concat(callArgs));
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true



function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}
  
// Function.prototype.curry = function(num){
//     const numbers = [];
//     const that = this;
//     return function _curriedSum(number){
//         numbers.push(number);
//         if (num === numbers.length){
//             return that.apply(this, numbers);
//         } else {
//             return _curriedSum;
//         } 
//     }
// }

Function.prototype.curry = function(num){
    const numbers = [];
    const that = this;
    return function _curriedSum(number){
        numbers.push(number);
        if (num === numbers.length){
            return that.call(this, ...numbers);
        } else {
            return _curriedSum;
        } 
    }
}

console.log(sumThree(4, 21, 6)); // == 30
  
// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(21); // [Function]
f1 = f1(6); // = 30
console.log(f1);
// or more briefly:
console.log(sumThree.curry(3)(4)(21)(6)); // == 30



