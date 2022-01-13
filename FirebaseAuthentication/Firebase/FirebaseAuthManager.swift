//
//  FirebaseAuthManager.swift
//  FirebaseAuthentication
//
//  Created by yasudamasato on 2022/01/06.
//

import Foundation
import Firebase

final class FirebaseAuthManager {

  func createUser(email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
      if let user = result?.user {
        print(user)
        completion(true)
      } else {
        completion(true)
      }
    }
  }

  func signIn(email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
      if let error = error {
        print(error.localizedDescription)
        completion(false)
      } else {
        completion(true)
      }
    }
  }

  func signOut(completion: @escaping (_ success: Bool) -> Void) {
    do {
      try Auth.auth().signOut()
      completion(true)
    } catch {
      completion(false)
    }
  }
}
