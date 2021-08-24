const NUMS = [1,2,3,4,5];


function returnElement(el) {
    console.log(el)
};

Array.prototype.myEach = function(callback){
    for (i=0; i<this.length; i++){
        callback(this[i]);
    }
}

NUMS.myEach(num => returnElement(num));


