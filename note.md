## Promise

- Promise là 1 khái niệm sinh ra để giúp chúng ta xứ lý các thao tác bất đồng bộ. Trước khi có promise thì chúng ta sử dụng callback dẫn đến callback hell --> promise sinh ra để giải quết vấn đề này.

- Để tạo ra promise ta dùng từ khoá new Promise ( bên trong này ta truyền vào 1 Executor function trong executor function có 2 tham số là resolve là thành công còn reject là thất bại)

- Khi sử dụng promise ta sử dụng với .then và .catch hoặc .finally 3 cái này đều nhận vào 1 callback nó chạy vào then khi promise gọi resolve() còn vào catch khi reject() còn finally là cả 2

**Promise có 3 trạng thái:**

- Pending
- Fulfilled
- Rejected

setTimeout, setInterval, fetch, XMLHttpRequest, file reading, request animmation frame --> **Async**

```
// Example for Async
setTimeout( () => { console.log(1);}, 1000);
console.log(2);
Promise.resolve();

Promise.reject();

Promise.all(promise1, promise2);
```

```
// DOM attributes

var headingElemnet = document.querySelector('h1');
headingElemnet.id ( title, className, ...) = 'Heading';
```

**Or**

```
headingElemnet.setAttribute('attributeName', 'value'); // Set attribute for tag

headingElemnet.getAttribute('attributeName'); // value of attributeName

consolve.log(headingElemnet .innerText); // content of h1 tag chỉ lấy ra những nội dung nhìn thấy ở tring duyệt

consolve.log(headingElemnet .textContent); // content of h1 tag lấy ra những nội dung trong DOM không bao gồm tag lấy cả dấu cách dấu tab

headingElemnet .innerText = 'New Content';

headingElemnet .innerHTML = '<h2>New Content</h2>'; // Thêm vào bên trong thẻ lấy về

headingElemnet .outerHTML = '<h2>New Content</h2>'; // Thay thế luôn thẻ lấy về
```

**// For/in loop**

```
var myInfo = {

    name: "John",

    age: 20,

    city: "New York"

};

for (var key in myInfo) {

    console.log(myInfo[key]);

}

var myString = 'Javascript';

for(var key in myString) {

    console.log(myString[key]);

}
```

**// For/of loop**

```
var language = [
    'JavaScript',
    'PHP',
    'Java'
]

for ( var value of language) {
    console.log(value);
};

for ( var value of myString) {
    console.log(value);
};

for ( var value of Object.keys(myInfo)){
    console.log(myInfo[value]);
}

for (var value of Object.values(myInfo)) {
    console.log(value);
}
```

**some() method**

```
// Arrow function

some((element) => { ... } )

some((element, index) => { ... } )

some((element, index, array) => { ... } )

// Callback function

some(callbackFn)

some(callbackFn, thisArg)

// Inline callback function

some(function callbackFn(element) { ... })

some(function callbackFn(element, index) { ... })

some(function callbackFn(element, index, array){ ... })

some(function callbackFn(element, index, array) { ... }, thisArg)
```

**Example :**

```
Array.prototype.mySome = function(cb) {

    var res = []

    var index = 0;

    for (var x of this) {

        if (cb(x, index, this)) {
            return true
        }

        index++
    }
    return false
}

/\*\*

Expected results:

const numbers = [1, 3, 3, 5];

console.log(numbers.mySome(function (number) {

    return number % 2 === 0;

})); Output: fals

console.log(numbers.mySome(function (number, index) {

    return index % 2 === 0;

})); Output: true

\*/
```

**every() method**

```
array.every(function(currentValue, index, arr), thisValue)
```

**Example :**

```
Array.prototype.myEvery = function(cb) {

    var res = []

    var index = 0;

    for (var x of this) {

        if (!cb(x, index, this)) {
            return false
        }

        index++
    }
    return true
}

// Expected results

const numbers = [1, 3, 3, 5];

console.log(numbers.myEvery(function (number) {

    return number % 2 !== 0;

})); // Output: true
```

**reduce() method**

```
let value = arr.reduce( function (accumulator, item, index, array) {

// code

}, [initial]);
```

**Example :**

```
function arrToObj(arr){

var obj = arr.reduce((result, currentValue) =>{

    result[currentValue[0]] = currentValue[1];

    return result;

}, {});

return obj;

}

// Expected results:

var arr = [

    ['name', 'Sơn Đặng'],

    ['age', 18],

];

console.log(arrToObj(arr)); // { name: 'Thanh Vu', age: 18 }
```

**map() method**

```
let result = arr.map(function (item, index, array) {

// return new value from every item

});
```

**Example :**

```
Array.prototype.myMap = function (cb){

    var arrLenght = this.length;

    var arr = [];

    for(let i = 0; i < arrLenght; i++){

        var result = cb(this[i], i);

        arr.push(result);

    }
    return arr;
};

// Expected results

const numbers = [1, 2, 3];

console.log(numbers.myMap(function (number) {

    return number * 2;

})); // Output: [2, 4, 6]
```

Search multiple element : You can filter() method

```
let results = arr.filter(function (item, index, array) {

// code

});
```

**Example :**

```
let users = [
{ id: 1, name: "Alex" },
{ id: 2, name: "John" },
{ id: 3, name: "Anna" },
];
let results = users.filter((item) => item.id <= 2);
console.log(results.length); // 2
```

**Example 2 :**

```
Array.prototype.myFilter = function(cb) {

    var res = []

    var index = 0;

    for (var x of this) {

        if (cb(x, index, this)) {
            res.push(x)
        }
        index++
    }
    return res

}

/\*\*

**Expected results:**

const numbers = [1, 2, 3, 4];

console.log(numbers.myFilter(function (number) {

    return number % 2 === 0;

})); Output: [2, 4]

\*\*/
```

**forEach() method**

```
arr.forEach(function (item, index, array) {
// code
});
```

**HTML DOM**

Include 3 ingredient :

- Element

- Attribute

- Text

```
document.write();

document.getElementId('idName') return a element

document.getElementsByTagName('tagName') return a HTMLCollection

document.getElementsByClassName('className') return a HTMLCollection

document.querySelector('.className || tagName || .className:nth-child(1|| 2|| ...)') return a element ( If many element then return fist element )

document.querySelectorAll('...') return a nodeList

document.forms || document.img || document.a
```

**Example :**

```
var boxNode = querySelector('.box-1');

console.log(boxNode.queryselector(...));

console.log(boxNode.getElementsByTagName (...));
```

## React Hooks

**useEffect**

```
useEffect( callback )

useEffect( callback, [] )

useEffect( callback, [deps])
```

Callback luôn được gọi sau khi component mounted

**useState**

- Khi gọi setState sẽ gọi làm hàm App()

- Giá trị initial chỉ dùng cho lần đầu

- Set state với callback

- Initial state với callback

**Example :**

````import logo from './logo.svg';
import './App.css';
import { useState } from 'react';
function App() {
  const [cnt, setCnt] = useState(1);
  const handler = (state) => {setCnt(cnt+1);};
  return (
    <div className="App">
      <h1>{cnt}</h1>
      <button onClick = {handler}>Click me !</button>
    </div>
  );
}
export default App;```
````
