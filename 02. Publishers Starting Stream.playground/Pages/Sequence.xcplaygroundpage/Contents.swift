//: [Previous](@previous)

// Sequence Publisher
// [1,2,3,4].publisher
// 1..2.publisher
// ["dictonary": 1, "array" : 2].publisher  -> tupes of (String, Int)
// [[]].publisher -> send nested arrays

import Foundation
import Combine

let subscription = [0, 1, 2].publisher.sink(receiveCompletion: {
    print("completion: \($0)")
},receiveValue: {
    print("value \($0)")
})

//--- nested array
var pub = [[1,2,3], [4, 5]].publisher
let sub = pub.sink { (nestedArrray) in
    print(nestedArrray)
}

let range = 0...2
let subscription2 = range.publisher.sink(receiveCompletion: {
    print("completion: \($0)")
},receiveValue: {
    print("value \($0)")
})

let dictionary = ["Bob": 1, "Karen": 2, "Susan": 3]
let subscription3 = dictionary.publisher
    //.map(\.key)
    .sink(receiveCompletion: {
    print("completion: \($0)")
},receiveValue: {
    print("value \($0)")
})






//: [Next](@next)
