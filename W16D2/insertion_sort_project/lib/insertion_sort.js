function insertionSort(arr) {
    for (let i = 1; i < arr.length; i++) {
        // grab the first element of the unsorted region
        let currElement = arr[i];
        
        // the `j` loop will iterate left through the sorted region,
        // looking for a legal spot to insert currElement
        for (var j = i - 1; j >= 0 && currElement < arr[j]; j--) {
            // keep moving left while currElement is less than the j-th element

            arr[j + 1] = arr[j];
            // the line above will move the j-th element to the right, 
            // leaving a gap to potentially insert currElement
        }
        // insert currElement into that gap
        arr[j + 1] = currElement;
    }
    return arr;
}

module.exports = {
    insertionSort
};