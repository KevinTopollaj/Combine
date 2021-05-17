//: [Previous](@previous)

import Foundation
import Combine

//example func
func create() -> AnyPublisher<String, Never> {
   return [1, 2, 3, 4, 5, 6].publisher
        .map { String($0) }
        .eraseToAnyPublisher()
}

//func to create Future
func loadFile(url: URL) -> AnyPublisher <Data, Error> {
    return Future { promise in
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try Data(contentsOf: url)
                print("found \(data)")
                promise(Result.success(data))
                
            } catch {
                promise(Result.failure(error))
            }
        }
    }.eraseToAnyPublisher()
}

let url = Bundle.main.url(forResource: "quote", withExtension: "json")!

let filePub = loadFile(url: url)
    .decode(type: Quote.self, decoder: JSONDecoder())
    .receive(on: DispatchQueue.main)
    .sink {
        print("completion \($0)")
    } receiveValue: {
        print("received quote \($0)")
    }


//: [Next](@next)
