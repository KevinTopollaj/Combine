//: [Previous](@previous)

// Firebase authentication
// https://firebase.google.com/docs/auth/ios/password-auth

import Foundation
import Combine

//import FirebaseAuth
//
//func firebaseCreateUser(email: String, password: String) -> AnyPublisher<User, NSError> {
//    return Future { promise in
//        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//            if let error = error as? NSError {
//                promise(Result.failure(error))
//            } else if let user = authResult?.user {
//                promise(Result.success(user))
//            }
//        }
//    }.eraseToAnyPublisher()
//}
//
//class AuthSubscriptionManager: NSObject, ObservableObject {
//
//    @Published var firebaseUser: User?
//
//    @Published var emailAdress: String = ""   // needs to be email format
//    @Published var password: String = ""     // min 6 characters
//    @Published var repeatPassword: String = ""     // same as password
//
//    @Published var errorMessage: String? = nil
//    @Published var showActivityIndicator: Bool = false
//
//    @Published var isEnabled: Bool = false
//
//    var createAccountRequested = PassthroughSubject<Void, Never>()
//    var subscriptions = Set<AnyCancellable>()
//
//    init() {
//        self.firebaseUser = Auth.auth().currentUser
//        setupFirebaseAuth()
//    }
//
//    func setupFirebaseAuth() {
//        createAccountRequested
//            .sink { [unowned self] _ in
//                self.errorMessage = nil
//                self.showActivityIndicator = true
//            }.store(in: &subscriptions)
//
//        createAccountRequested
//            .flatMap { [unowned self] in
//                firebaseCreateUser(email: self.emailAdress, password: self.password)
//                    .handleEvents(receiveSubscription: { (_) in
//
//                    }, receiveOutput: { (newUser) in
//
//                    }, receiveCompletion: { [unowned self] (error) in
//                        //check error case and update message for user
//                        if let errCode = AuthErrorCode(rawValue: error._code) {
//                            self.errorMessage = errCode.displayDesciption
//                        }
//                    }, receiveCancel: { [unowned self] in
//                        self.errorMessage = "Sorry, please try again."
//                    }, receiveRequest: { (_) in
//
//                    })
//                    .replaceError(with: nil)
//            }
//            .sink { [unowned self] user in
//                self.firebaseUser = user
//                self.showActivityIndicator = false
//        }.store(in: &subscriptions)
//    }
//}
//
//extension AuthErrorCode {
//     var displayDesciption: String {
//         switch self {
//         case .emailAlreadyInUse:
//             return "The email is already in use with another account."
//         case .userNotFound:
//             return "Account not found for the specified user. Please check and try again."
//         // This error also occured if you would have deleted the account."
//         case .userDisabled:
//             return "Your account has been disabled. Please contact support."
//         case .invalidEmail, .invalidSender, .invalidRecipientEmail:
//             return "Please enter a valid email."
//         case .networkError:
//             return "The Internet connection appears to be offline."
//         case .weakPassword:
//             return "Your password is too weak. The password must be 6 characters long or more."
//         case .wrongPassword:
//             return "Your password is incorrect. Please try again or use 'Forgot password' to reset your password."
//
//         case .userTokenExpired:
//            return "We have a problem with you account. Did you changed account password on another device? Please sign in again on this device."
//
//         case .tooManyRequests:
//            return "We are to busy right now. Please try again later."
//
//            //update email/password/delete
//         case .operationNotAllowed:
//            return "You need to verify this action by logging in again."
//
//
//
//         default:
//             return "Unknown error occurred"
//         }
//     }
//}

//: [Next](@next)
