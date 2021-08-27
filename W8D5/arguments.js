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
Function.prototype.myBind = function(ctx){
    const that = this;
    const arr = Array.from(arguments).slice(1);
    // console.log("this is the arg array:" + arr);
    return function(){
        let callArgs = Array.from(arguments);
        // console.log("this is the callArgs:" + callArgs);
        return that.apply(ctx, arr.concat(callArgs));
    }
}

// with ... rest operator

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
