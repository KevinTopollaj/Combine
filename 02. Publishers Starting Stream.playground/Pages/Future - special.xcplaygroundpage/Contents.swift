//: [Previous](@previous)

// Future<Output, Failure> 

// asynchronos work
// ad-hoc callback
// Replace Completion-Handler Closures with Futures

//docs https://developer.apple.com/documentation/combine/using-combine-for-your-app-s-asynchronous-code

/*
 The following is a list of some key rules to keep in mind when using Futures in Combine:

 - A Future will begin executing immediately when you create it.
 - A Future will only run its supplied closure once.
 - Subscribing to the same Future multiple times will yield in the same result being returned.
 - A Future in Combine serves a similar purpose as RxSwift's Single but they behave differently.
 */


import Foundation
import Combine

func performAsyncAction(completionHandler: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline:.now() + 2) {
        completionHandler()
    }
}

//as a Future publisher
func performAsyncActionAsFuture() -> Future <Void, Never> {
    return Future() { promise in
        DispatchQueue.main.asyncAfter(deadline:.now() + 2) {
            promise(Result.success(()))
        }
    }
}

let cancellable = performAsyncActionAsFuture().sink { (_) in
    print("Future succeeded.")
}


func performAsyncActionAsFutureWithParameter() -> Future <Int, Never> {
    return Future() { promise in
        DispatchQueue.main.asyncAfter(deadline:.now() + 2) {
            let rn = Int.random(in: 1...10)
            promise(Result.success(rn))
        }
    }
}


let cancellable2 = performAsyncActionAsFutureWithParameter().sink { value in
    print("Future succeeded with \(value).")
}


//examples
// firebase authenication completion handler
// push notifications

//: [Next](@next)
