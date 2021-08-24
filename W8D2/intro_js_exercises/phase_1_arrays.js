function uniq (arr) {
    // arr.forEach 
    let output=[];
    for(let i=0; i<arr.length; i++){
        if ( !output.includes(arr[i]) ) {
            output.push(arr[i]);
        }
    }
    return output;
}

// console.log(uniq([1,1,2,2,3]));

Array.prototype.uniq2 = function(){
    let output = [];
    for (let i = 0; i < this.length; i++) {
        if (!output.includes(this[i])) {
            output.push(this[i]);
        }
    }
    return output;
}

// let arr1= [1,1,2,2,3]
// console.log(arr1.uniq2())
// console.log(arr1)


/////////
// twosum : returns an array of position pairs where the elements sum to zero
// [1,-1,2,3] => [0,1]

Array.prototype.twoSum = function (){
    let output=[];
    for(let i=0; i<this.length; i++){
        for(let j=i+1; j<this.length; j++){
            if (this[i]+this[j]=== 0){
                output.push([i,j]);
            }
        }
    }
    return output;
}

// console.log([1, -1, 2, 3].twoSum() );
// console.log([1, -1, 2, 3, 5,-2].twoSum());

/////////
// transpose

Array.prototype.transpose = function(){
    let outer_arr=[];
    // 
    for(let i=0; i<this.length; i++){
        let inner_arr = [];  // 2-d array 
        for (let j = 0; j < this[0].length; j++){
            inner_arr.push([i,j]);  // 0,0  0,1  0,2
        }

    }

}

Array.prototype.transpose = function () {
    let outer_arr = [];

    for (let i = 0; i < this[0].length; i++) {     //  0~2
        let inner_arr = [];
        for (let j = 0; j < this.length; j++) {  // 0~1
            inner_arr.push( this[j][i] ); 
        }
        outer_arr.push(inner_arr)
    }
    return outer_arr;
}

const arr_2d = [
    [1,2],
    [2,1]
]

const arr_3d = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]


const arr_2x3 = [
    [1,2,3],
    [4,5,6]
]

console.log(arr_2d.transpose());  // [[1,2],[2,1]]
console.log(arr_3d.transpose());  // [[1,4,7],[2,5,8],[3,6,9]]
console.log(arr_2x3.transpose());  // [[1,4],[2,5],[3,6]]
