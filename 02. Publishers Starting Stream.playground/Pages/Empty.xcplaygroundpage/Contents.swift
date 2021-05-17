//: [Previous](@previous)

//Empty
//A publisher that never publishes any values, and optionally finishes immediately.

//“This publisher is useful for demo or testing purposes, or when all you want to do is signal completion of some task to a subscribe”


import Foundation
import Combine

// Empty(completeImmediately: true) - never sends value, finishes normally
// Empty(completeImmediately: false) - ”Never” publisher — one which never sends values and never finishes or fails

let pubNever = Empty<String, Never>(completeImmediately: true)
    .sink(receiveCompletion: { print("completion \($0)")
    },receiveValue: {
        print("value \($0)")
    })



// compare to func with Fail
func createFailinPublisher(number: Int) -> AnyPublisher<String, Never> {
    if number < 10 {
        return Just("\(number)")
            .eraseToAnyPublisher()
    }else {
        return Empty(completeImmediately: true)
            .eraseToAnyPublisher()
    }
}

let numberSubject = CurrentValueSubject<Int, Never>(0)

let pub = createFailinPublisher(number: 11)
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


//: [Next](@next)
