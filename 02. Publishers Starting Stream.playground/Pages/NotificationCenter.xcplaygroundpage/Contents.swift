//: [Previous](@previous)

/* NotificationCenter
 - start stream when device rotates, keyboard appears, textField didchange

extension NotificationCenter {
   struct Publisher: Combine.Publisher {
      typealias Output = Notification
      typealias Failure = Never
      init(center: NotificationCenter, name: Notification.Name, object: Any? = nil)
   }
}
*/

import Foundation
import Combine
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


let myNotification = Notification.Name("NewItem")
let publisher = NotificationCenter.default
    .publisher(for: myNotification, object: nil)
    .sink { (value) in
        print("receive value \(value)")
        if let text = value.object as? String {
            print("object: \(text)")
        }
    }

NotificationCenter.default.post(name: myNotification, object: "great stuff")


// example

var isPortraitMode: Bool = false

let center = NotificationCenter.default
let cancellable = center
    .publisher(for: UIDevice.orientationDidChangeNotification)
    .filter() { _ in UIDevice.current.orientation == .portrait }
    .sink() { _ in
        print ("Orientation changed to portrait.")
        isPortraitMode = UIDevice.current.orientation == .portrait
    }

center
    .post(Notification(name: UIDevice.orientationDidChangeNotification, object: nil, userInfo: nil))


//example textField change

//: [Next](@next)
