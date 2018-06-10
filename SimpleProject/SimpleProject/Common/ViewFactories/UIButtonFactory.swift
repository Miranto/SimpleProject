//
//  UIButtonFactory.swift
//  Simple Project
//
//  Created by Mateusz Mirkowski on 22/11/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

extension UIButton {
  
  static func makeButton(with title: String = "", textColor: UIColor = Constants.UI.Color.baseMediumGrey,  font: Font = Font.example, asset: Asset? = nil) -> UIButton {
    let button = UIButton(frame: .zero)
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = UIFont(name: font.rawValue, size: 14.0)
    button.setTitleColor(textColor, for: .normal)
    if let asset = asset {
      button.setBackgroundImage(UIImage(asset: asset), for: .normal)
    }
    
    return button
  }
  
//  static func makeButton(with asset: Asset) -> UIButton {
//    let button = UIButton(frame: .zero)
//    button.setBackgroundImage(UIImage(asset: asset), for: .normal)
//    return button
//  }

}
