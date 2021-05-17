//: [Previous](@previous)

import Foundation
import Combine

var baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
let endpoints = ["posts", "users", "comments", "albums"]

let subscription4 = endpoints.publisher
    .map({
        baseURL.appendingPathComponent($0)
    })
  .sink(receiveCompletion: { completion in
    print("Completed with: \(completion)")
  }, receiveValue: { result in
    print(result)
  })


let postEndpoint = baseURL.appendingPathComponent("posts")

let subscription5 = (1...10).publisher
    .map({
        postEndpoint.appendingPathComponent(String($0))
    })
    .flatMap({ url -> URLSession.DataTaskPublisher in
        return URLSession.shared.dataTaskPublisher(for: url)
    })
    .sink(receiveCompletion: { completion in
        print("Completed with: \(completion)")
    }, receiveValue: { result in
        print(result)
    })

//: [Next](@next)
