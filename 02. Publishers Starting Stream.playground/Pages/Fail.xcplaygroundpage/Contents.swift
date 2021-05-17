//: [Previous](@previous)

// A publisher that immediately terminates with the specified error.
// similar to Just publish this error

import Foundation
import Combine

struct MyError: Error {}
let fail = Fail<String, MyError>(error: MyError())

let sub = fail.sink(receiveCompletion: {
    switch $0 {
    case .finished:
        print("completion: finished")
    case .failure(let error):
        print("completion with failur: \(error)")
    }
},receiveValue: {
    print("value \($0)")
})


// completes with finish

let subject = CurrentValueSubject<Int, MyError>(1)

let subsciption2 = subject
    .sink(receiveCompletion: {
    switch $0 {
    case .finished:
        print("completion: finished")
    case .failure(let error):
        print("completion with failur: \(error)")
    }
},receiveValue: {
    print("value \($0)")
})

subject.send(2)
subject.send(0)
subject.send(3)







//: [Next](@next)
