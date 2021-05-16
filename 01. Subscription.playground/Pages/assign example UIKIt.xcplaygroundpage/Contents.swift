//: [Previous](@previous)

import UIKit
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class TextFieldViewController : UIViewController, UITextFieldDelegate {

    var label : UILabel = UILabel()
    var textField : UITextField!

    var textMessage = CurrentValueSubject<String, Never>("Hello World")
    
    var subsrciptions = Set<AnyCancellable>()
    
    override func loadView() {

        // setup UI with textField and label
        let view = UIView()
        view.backgroundColor = .white

        textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.text = textMessage.value
        view.addSubview(textField)

        label = UILabel()
        view.addSubview(label)
        
        //use Combine to create assign(to,on) Subscribtion on the textMessage Publisher
      textMessage
        // use the compactMap Operator which will unwrap values and discard them if they are nil
        .compactMap { $0 }
        .map { "You typed: \($0)" }
        // use the assign(to,on) Subscriber to assign the value to the text of the label
        .assign(to: \.text, on: label)
        // store the created subscription so you can keep reference to it
        .store(in: &subsrciptions)
      
        

        self.view = view

        // set Autolayout constraints
        textField.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: margins.trailingAnchor),

            label.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
        ])

        
        //update label whenever textValue changes
        textField.addTarget(self, action: #selector(updateText), for: .editingChanged)
    }

    @objc func updateText() {
        self.textMessage.value = textField.text ?? ""
    }
}

let controller = TextFieldViewController()
//controller.textMessage.send("next big thing")

PlaygroundPage.current.liveView = controller

//: [Next](@next)
