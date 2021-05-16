//: [Previous](@previous)

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let subscription = URLSession.shared.dataTaskPublisher(for: URL(string: "https://jsonplaceholder.typicode.com")!)
  .map({ result in
    print(Thread.current.isMainThread)
  })
  // to set the upstream to main but it can not change it because dataTaskPublisher is set to run on the background.
  .subscribe(on: DispatchQueue.main)
  .receive(on: DispatchQueue.main)
  .sink(receiveCompletion: { _ in },
        receiveValue: { value in
    print(Thread.current.isMainThread)
  })


//: [Next](@next)
