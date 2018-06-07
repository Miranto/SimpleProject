//
//  BasicView.swift
//  SimpleProject
//
//  Created by Mateusz Mirkowski on 07/06/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import UIKit

protocol BasicView where Self: UIView {
  func setupView()
  func addSubviews()
  func setupLayout()
}
