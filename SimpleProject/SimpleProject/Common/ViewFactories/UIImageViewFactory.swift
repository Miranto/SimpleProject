//
//  UIImageViewFactory.swift
//  Move Sandbox
//
//  Created by Mateusz Mirkowski on 21/11/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

extension UIImageView {
  
  static func makeImageView(with asset: Asset?) -> UIImageView {
    let imageView = UIImageView(frame: .zero)
    imageView.contentMode = .scaleAspectFit
    if let asset = asset {
      imageView.image = UIImage(asset: asset)
    }
    return imageView
  }
  
}
