//: [Previous](@previous)

// - use for UIControl?
// works in playground but not in uiviewcontroller

import Combine
import UIKit

let textField = UITextField()
var textMessage = CurrentValueSubject<String, Never>("")

let sub = textField.publisher(for: \.text)
    .compactMap({ $0 })
    .sink {
       // print("textfield change to: \($0)")
        textMessage.value = $0
    }

let sub2 = textMessage.sink {
    print("text property did change to: \($0)")
}


DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    textField.text = "he"
}
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    textField.text = "hello"
}
DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    textField.text = "hello world"
}

//: [Next](@next)
