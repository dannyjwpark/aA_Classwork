const NUMS = [1,2,3,4,5];


function returnElement(el) {
    console.log(el)
};

Array.prototype.myEach = function(callback){
    for (i=0; i<this.length; i++){
        callback(this[i]);
    }
}

// NUMS.myEach(num => returnElement(num));

function double(el){
    console.log(el * 2)
}

Array.prototype.myMap = function(callback){
    
    const mapped = [];

    this.myEach(el => mapped.push(callback(el)) );
  
    return mapped;
}

NUMS.myMap( num => double(num));

