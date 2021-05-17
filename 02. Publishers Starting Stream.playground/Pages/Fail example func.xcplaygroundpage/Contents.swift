//: [Previous](@previous)

import Foundation
import Combine

func createFailinPublisher(number: Int) -> AnyPublisher<String, NumberError> {
    if number < 10 {
       return Just("\(number)")
        .setFailureType(to: NumberError.self)
        .eraseToAnyPublisher()
    }else {
       return Fail(error: NumberError.numberIsToLarge)
        .eraseToAnyPublisher()
    }
}

enum NumberError: Error {
    case numberIsToLarge
}

let numberSubject = CurrentValueSubject<Int, Never>(0)

let pub = createFailinPublisher(number: 10)
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
