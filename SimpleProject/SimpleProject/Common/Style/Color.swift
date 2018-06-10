//
//  Color.swift
//  Simple Project
//
//  Created by Mateusz Mirkowski on 21/11/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

extension UIColor {
  
  convenience init(redValue: CGFloat, greenValue: CGFloat, blueValue: CGFloat, alpha: CGFloat) {
    self.init(red: redValue/255.0, green: greenValue/255.0, blue: blueValue/255.0, alpha: alpha)
  }
  
}
