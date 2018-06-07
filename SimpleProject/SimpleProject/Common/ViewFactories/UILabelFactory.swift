//
//  UILabelFactory.swift
//  Move Sandbox
//
//  Created by Mateusz Mirkowski on 23/11/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

extension UILabel {
  
  static func makeLabel(text: String? = "", color: UIColor = Constants.UI.Color.baseMediumGrey, font: Font = .central2bold, size: CGFloat = 16, alignment: NSTextAlignment = .left) -> UILabel {
    let label = UILabel(frame: .zero)
    label.text = text
    label.textColor = color
    label.font = UIFont(name: font.rawValue, size: size)
    label.numberOfLines = 0
    label.textAlignment = alignment
    return label
  }
  
  static func makeLabel(localizedText: Localized?, color: UIColor = Constants.UI.Color.baseMediumGrey, font: Font = .central2bold, size: CGFloat = 16, alignment: NSTextAlignment = .left) -> UILabel {
    return makeLabel(text: localizedText?.string, color: color, font: font, size: size, alignment: alignment)
  }
}
