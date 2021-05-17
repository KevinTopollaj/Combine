//: [Previous](@previous)

//Deferred - A publisher that awaits subscription before running the supplied closure to create a publisher for the new subscriber.


import Foundation
import Combine

// deferre Future

func createFuture() -> AnyPublisher<Int, Never> {
  return Deferred {
    Future { promise in
      print("Future code is executed")
      promise(.success(42))
    }
  }.eraseToAnyPublisher()
}

let future = createFuture() // nothing happens yet
print("starting now \n")

let sub1 = future.sink(receiveValue: { value in
  print("sub1: \(value)")
}) // the Future executes because it has a subscriber

let sub2 = future.sink(receiveValue: { value in
  print("sub2: \(value)")
})


//: [Next](@next)
