//: [Previous](@previous)

// publishers that will pass a limited number of values

import UIKit
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let foodbank: Publishers.Sequence<[String], Never> = ["apple","bread","orange","milk"].publisher

//let subscription = foodbank
//  .sink { completion in
//    print("Completion: \(completion)")
//  } receiveValue: { foodItem in
//    print("Recive item: \(foodItem)")
//  }

let timePublisher = Timer.publish(every: 1, on: .main, in: .common)
  .autoconnect()

let calendar = Calendar.current
let endDate = calendar.date(byAdding: .second, value: 3, to: Date())!

struct MyError: Error {}

// throwing function
func throwAtEndDate(foodItem: String, date: Date) throws -> String {
  if date < endDate {
    return "\(foodItem) at \(date)"
  } else {
    throw MyError()
  }
}

let subscription = foodbank
  // operator that will combine values of two publishers creating a tuple
  .zip(timePublisher)
  // operator that will try to transform items, in our case in a String
  .tryMap({ (foodItem, timestamp) in
    try throwAtEndDate(foodItem: foodItem, date: timestamp)
  })
  // subscriber
  .sink { completion in
    switch completion {
    case .finished:
      print("Completion: finished")
    case .failure(let error):
      print("Completion with error: \(error.localizedDescription)")
    }
  } receiveValue: { result in
    print("Recive item: \(result)")
  }



//: [Next](@next)
