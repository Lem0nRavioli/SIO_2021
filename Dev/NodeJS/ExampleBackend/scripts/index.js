const myForeach = (array, callback) => {

    for (let index = 0; index < array.length; index++) {
        const element = array[index];

        callback(element, index, array)
    }
}


const todos = [54, 56, 87];

// arr.forEach((element, index, tableau) => {
//     console.log(element);
//     console.log(index);
//     console.log(tableau);
// })

const mult2 = (array) => {
    myForeach(array, (element, index, array) => {
        element = element * 2;
        array[index] = element;
    });
}

mult2(todos);

console.log(todos);
