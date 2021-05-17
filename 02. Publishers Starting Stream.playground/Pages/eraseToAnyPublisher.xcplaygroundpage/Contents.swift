//: [Previous](@previous)

// eraseToAnyPublisher
// Use eraseToAnyPublisher() to expose an instance of AnyPublisher to the downstream subscriber, rather than this publisher’s actual type. This form of type erasure preserves abstraction across API boundaries, such as different modules. When you expose your publishers as the AnyPublisher type, you can change the underlying implementation over time without affecting existing clients.

import Foundation
import Combine

let subject = PassthroughSubject<Int, Never>()
let erasedSubject: AnyPublisher<Int, Never> = subject.eraseToAnyPublisher()

subject.send(1)
//erasedSubject.send() // does not exist
//making erasedSubject a read only property - access control

let sub = erasedSubject.sink {
    print("subject send \($0)")
}

//nested publisher type
let subjectWithOperators = subject.filter({ $0 > 5 }).map({ "new: \($0)" })
// Publishers.Map<Publishers.Filter<PassthroughSubject<Int, Never>>, String>

let erasedSubjectWithOperators = subject.filter({ $0 > 5 }).map({ "new: \($0)" }).eraseToAnyPublisher()
// AnyPublisher<String, Publishers.Map<Publishers.Filter<PassthroughSubject<Int, Never>>, String>.Failure>
// error is passed down, type is the same as from upstream publisher





//: [Next](@next)
