//
//  ViewController.swift
//  FirebaseAuthentication
//
//  Created by yasudamasato on 2022/01/06.
//

import UIKit

final class ViewController: UIViewController {

  @IBOutlet private weak var loginEmailTextField: UITextField!
  @IBOutlet private weak var loginPasswordTextField: UITextField!
  @IBOutlet private weak var loginButton: UIButton! {
    didSet {
      loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
    }
  }
  @IBOutlet private weak var registerEmailTextField: UITextField!
  @IBOutlet private weak var registerPasswordTextField: UITextField!
  @IBOutlet private weak var registerButton: UIButton! {
    didSet {
      registerButton.addTarget(self, action: #selector(didTapRegisterButton(_:)), for: .touchUpInside)
    }
  }

  @objc private func didTapLoginButton(_ sender: UIResponder) {
    guard let email = loginEmailTextField.text, let password = loginPasswordTextField.text else {
      return
    }
    FirebaseAuthManager().signIn(email: email, password: password) { [weak self] success in
      guard self != nil else { return }
      if success {
        print("success login")
        self?.showLogout()
      } else {
        print("failure login")
      }
    }
  }

  @objc private func didTapRegisterButton(_ sender: UIResponder) {
    guard let email = registerEmailTextField.text, let password = registerPasswordTextField.text else {
      return
    }
    FirebaseAuthManager().createUser(email: email, password: password) { [weak self] success in
      guard self != nil else { return }
      if success {
        print("success register")
      } else {
        print("failure register")
      }
    }
  }
}

private extension ViewController {
  func showLogout() {
    guard let vc = UIStoryboard.init(name: "Logout", bundle: nil).instantiateInitialViewController() as? LogoutViewController else {
      return
    }
    self.present(vc, animated: true, completion: nil)
  }
}
