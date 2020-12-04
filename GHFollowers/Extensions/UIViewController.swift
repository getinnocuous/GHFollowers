//
//  UIViewController + Ext.swift
//  GHFollowers
//
//  Created by Elliot Waddington on 16/10/2020.
//

import UIKit

extension UIViewController {
  func presentEWAlertOnMainThread(title: String, message: String, buttonTitle: String) {
    DispatchQueue.main.async {
      let alertVC = EWAlertVC(title: title, message: message, buttonTitle: buttonTitle)
      alertVC.modalPresentationStyle = .overFullScreen
      alertVC.modalTransitionStyle = .crossDissolve
      self.present(alertVC, animated: true)
    }
  }
}
