//
//  UIViewController+Extensions.swift
//  Move Sandbox
//
//  Created by Mateusz Mirkowski on 23/11/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func hideNavigationBar() {
    navigationController?.navigationBar.isHidden = true
  }
  
  func showNavigationBar() {
    navigationController?.navigationBar.isHidden = false
  }
  
  func setAttributedTitle(with text: String) {
    let textAttributes = [NSAttributedStringKey.font: UIFont(name: Font.central2bold.rawValue, size: 18.0 ), NSAttributedStringKey.foregroundColor:UIColor.white]
    navigationController?.navigationBar.titleTextAttributes = textAttributes as Any as? [NSAttributedStringKey : Any]
    title = text
  }
  
}
