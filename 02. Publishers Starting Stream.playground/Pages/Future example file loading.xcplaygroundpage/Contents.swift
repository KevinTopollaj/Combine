//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import Combine

let url = Bundle.main.url(forResource: "quotes", withExtension: "json")!
print(url)
//check if path exists before calling getUserFile

let future = Future<Data, Error> { promise in
    DispatchQueue.global(qos: .background).async {
        do {
            let data = try Data(contentsOf: url)
            print("found \(data)")
            promise(Result.success(data))
        } catch {
            promise(Result.failure(error))
        }
    }
}


let sub1 = future
    .decode(type: [Quote].self, decoder: JSONDecoder())
    .catch {error in
        return Just([Quote]())
    }
    .receive(on: DispatchQueue.main)
    .sink {
        print("completion \($0)")
    } receiveValue: { quotes in
        print("received quotes ------")
        for quote in quotes {
            print("quote \(quote.author): \(quote.quoteText)")
        }
    }


//more complexe: dynamic loading possible with -> need publisher that publishes other publishers : flatmap



//: [Next](@next)
