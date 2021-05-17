//: [Previous](@previous)

import Foundation
import Combine

//example   -------------
func getQuotes(url: URL) -> AnyPublisher <[Quote], Error> {
    do {
        let data = try Data(contentsOf: url)
        return Just(data)
            .decode(type: [Quote].self, decoder: JSONDecoder())
            .catch {error in
                return Just([Quote]())
            }
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    } catch {
        return Fail(error: error)
            .eraseToAnyPublisher()
    }
}



let url = Bundle.main.url(forResource: "quotes", withExtension: "json")!
print(url)


let subsc = getQuotes(url: url)
    .subscribe(on: DispatchQueue(label: "fileLoading"))
    .receive(on: DispatchQueue.main)
    .sink {
        print("completion \($0)")
    } receiveValue: { quotes in
        print("received quotes ------ on \(Thread.current) ")
        for quote in quotes {
            print("quote \(quote.author): \(quote.quoteText)")
        }
    }

//let subsc = Just(url)
//    .filter({ FileManager.default.fileExists(atPath: $0.path) })
//    .flatMap { url in
//        return getUserFile(url: url)
//    }
//    .subscribe(on: DispatchQueue(label: "fileLoading"))
//    .receive(on: DispatchQueue.main)
//    .sink {
//        print("completion \($0)")
//    } receiveValue: { quotes in
//        print("received quotes ------ on \(Thread.current) ")
//        for quote in quotes {
//            print("quote \(quote.author): \(quote.quoteText)")
//        }
//    }
//: [Next](@next)
