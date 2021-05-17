//: [Previous](@previous)

//URLSession.shared.dataTaskPublisher(for: URL)
//URLSession.shared.dataTaskPublisher(for: URLRequest)

import Foundation
import Combine

struct Post: Codable {
    let id: Int
    let title: String
    let userId: Int
    let body: String
}

let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!

let sub = URLSession.shared.dataTaskPublisher(for: url).sink {
    print("completion \($0)")
} receiveValue: { (data, response) in
    if let response = response as? HTTPURLResponse {
        print("response \(response.statusCode)")
    }
    print("received data \(data)")
}


//let sub = URLSession.shared.dataTaskPublisher(for: url)
//    .map(\.data)
//    .decode(type: Post.self, decoder: JSONDecoder())
//    .receive(on: DispatchQueue.main)
//    .sink { print("completion with \($0)")
//    } receiveValue: {
//        print("receive value: \($0.title)")
//        $0
//    }




//: [Next](@next)
