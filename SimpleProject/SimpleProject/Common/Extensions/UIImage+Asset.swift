//
//  UIImage+Asset.swift
//  Move Sandbox
//
//  Created by Mateusz Mirkowski on 21/11/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

extension UIImage {
  convenience init?(asset: Asset) {
    self.init(named: asset.rawValue)
  }
}

