//
//  RoundedView.swift
//  Move Sandbox
//
//  Created by Mateusz Mirkowski on 21/11/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

protocol RoundedView {}

extension RoundedView where Self: UIView {
  
  func updateCornerRadius() {
    layer.cornerRadius = 5
  }
  
}


