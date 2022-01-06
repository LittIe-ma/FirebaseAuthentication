//
//  LogoutViewController.swift
//  FirebaseAuthentication
//
//  Created by yasudamasato on 2022/01/06.
//

import UIKit

final class LogoutViewController: UIViewController {

  @IBOutlet private weak var logoutButton: UIButton! {
    didSet {
      logoutButton.addTarget(self, action: #selector(didTapLogoutButton(_:)), for: .touchUpInside)
    }
  }

  @objc private func didTapLogoutButton(_ sender: UIResponder) {
    FirebaseAuthManager().signOut { [weak self] success in
      guard self != nil else { return }
      if success {
        print("success signout")
        self?.back()
      } else {
        print("failure signout")
      }
    }
  }
}

private extension LogoutViewController {
  func back() {
    self.dismiss(animated: true, completion: nil)
  }
}
