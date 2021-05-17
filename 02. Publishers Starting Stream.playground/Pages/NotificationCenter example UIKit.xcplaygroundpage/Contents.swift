//: [Previous](@previous)

import Foundation
import Combine
import PlaygroundSupport
import UIKit

PlaygroundPage.current.needsIndefiniteExecution = true

let textField = UITextField()
var textMessage = CurrentValueSubject<String, Never>("")

//let sub = textField.publisher(for: \.text)
//    .compactMap({ $0 })
//    .sink {
//       // print("textfield change to: \($0)")
//        text.value = $0
//    }

let sub = NotificationCenter.default
    .publisher(for: UITextField.textDidChangeNotification, object: textField)
//    .map( { ($0.object as! UITextField).text } ) //add 2
//    .replaceNil(with: "")
    .sink { value in
        print("val \(value)")
      //  textMessage.value = value
    }
    

let sub2 = textMessage.sink {
    print("text property did change to: \($0)")
}


DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    print("1")
    textField.text = "he"
}
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    print("2")
    textField.text = "hello"
}
DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    print("3")
    textField.text = "hello world"
}


//: [Next](@next)
