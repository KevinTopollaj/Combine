//: [Previous](@previous)

import Foundation
import Combine

class TestObject: NSObject {
  // 2
  @objc dynamic var integerProperty: Int = 0
}

let obj = TestObject()

// 3
let subscription = obj.publisher(for: \.integerProperty, options: [.new])
  .sink {
    print("integerProperty changes to \($0)")
  }

// 4
obj.integerProperty = 100
obj.integerProperty = 200





//: [Next](@next)
