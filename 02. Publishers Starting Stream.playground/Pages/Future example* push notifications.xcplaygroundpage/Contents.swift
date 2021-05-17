//: [Previous](@previous)

//examples for Future: Push notifications

import Foundation
import Combine
import UIKit


//Push notification settings
UNUserNotificationCenter.getNotificationSettings { settings in
   //...
}

// initiate request for push notifications
UNUserNotificationCenter.requestAuthorization(options: options) { result, error in
   //...
}


extension UNUserNotificationCenter {
  func getNotificationSettings() -> Future<UNNotificationSettings, Never> {
    return Future { promise in
      self.getNotificationSettings { settings in
        promise(.success(settings))
      }
    }
  }
}
extension UNUserNotificationCenter {
  func requestAuthorization(options: UNAuthorizationOptions) -> Future<Bool, Error> {
    return Future { promise in
      self.requestAuthorization(options: options) { result, error in
        if let error = error {
          promise(.failure(error))
        } else {
          promise(.success(result))
        }
      }
    }
  }
}

//use like

let sub = UNUserNotificationCenter.current().getNotificationSettings()
  .flatMap({ settings -> AnyPublisher<Bool, Never> in
    switch settings.authorizationStatus {
    case .denied:
      return Just(false)
        .eraseToAnyPublisher()
    case .notDetermined:
      return UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        .replaceError(with: false)
        .eraseToAnyPublisher()
    default:
      return Just(true)
        .eraseToAnyPublisher()
    }
  })
    .print()
  .sink(receiveValue: { hasPermissions in
    print(" point user to settings \(hasPermissions)")
    if hasPermissions == false {
      DispatchQueue.main.async {
        print(" point user to settings ")
      }
    }
  })




// --- old
UNUserNotificationCenter.current().getNotificationSettings { settings in
  switch settings.authorizationStatus {
  case .denied:
    DispatchQueue.main.async {
      // update UI to point user to settings
    }
  case .notDetermined:
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { result, error in
      if result == true && error == nil {
        // We have notification permissions
      } else {
        DispatchQueue.main.async {
          // Something went wrong / we don't have permission.
          // update UI to point user to settings
        }
      }
    }
  default:
    // assume permissions are fine and proceed
    break
  }
}


// ===== example:  Touch ID or Face ID authentication into a future

//let context = LAContext()
//
//let authenticate = Future<Void, Error> { promise in
//    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "") { isSuccess, error in
//        isSuccess ? promise(.success(())) : promise(.failure(error!))
//    }
//}
//
//authenticate
//    .receive(on: DispatchQueue.main) // Move to the main thread
//    .sink(receiveCompletion: { completion in
//        switch completion {
//        case .failure(let error): ()
//        case .finished: ()
//        }
//    }, receiveValue: { _ in })

//: [Next](@next)
