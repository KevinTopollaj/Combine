//: [Previous](@previous)

// How to create a subscription?
// What does a publisher without a subscription?
// What does data stream mean?


import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// Create a subscription
var subscription: AnyCancellable? = Timer.publish(every: 1, on: .main, in: .common)
  // will autoconnect to send values
  .autoconnect()
  // allow values to pass in every 2sec in the main queue
  .throttle(for: .seconds(2), scheduler: DispatchQueue.main, latest: true)
  // add an operator to transform data
  .scan(0, { count, _ in
    count + 1
  })
  // add another operator to filter data
  .filter({ count in
    count < 6
  })
  // create a Subscriber
  .sink { completion in
    print("Data stream completion \(completion)")
  } receiveValue: { timestamp in
    print("recived value: \(timestamp)")
  }

// stop the subscription from sending values after 5 sek by calling .cancel() or if it is optional asign it the value `nil`
DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
//  subscription.cancel()
  subscription = nil
}


//: [Next](@next)
