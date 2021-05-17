//: [Previous](@previous)

// Timer

// Tip: Because Timer.TimerPublisher conforms to the ConnectablePublisher protocol, it won’t produce elements until you explicitly connect to it. Do this by either calling connect(), or using an autoconnect() operator to connect automatically when a subscriber attaches.

import Foundation
import Combine


let timer = Timer.publish(every: 1, on: .main, in: .default)
    .autoconnect()  //will start automatically when a subscripber is attached
    //.connect() // will start immediatly

let cancellable = timer
    .receive(on: DispatchQueue.main)
    .sink {
        print("receive time - \($0)")
    }


// create counter

let timerPublisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    .scan(0) { counter, _ in counter + 1 }
    .sink { (value) in
        print("received value \(value)" )
    }
//let sequencePublisher = ["a","b","c","d"].publisher
//
//let sub = sequencePublisher.zip(timerPublisher)
//    .print()
//    .map({return "\($0) and \($1)"})
//    .sink { (value) in
//        print("received value \(value)" )
//    }

//: [Next](@next)
