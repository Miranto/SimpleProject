//
//  UIViewFactory.swift
//  Move Sandbox
//
//  Created by Mateusz Mirkowski on 21/11/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

extension UIView {
  
  static func makeView(with color: UIColor) -> UIView {
    let view = UIView(frame: .zero)
    view.backgroundColor = color
    return view
  }
  
}
