//
//  String+Extensions.swift
//  Simple Project
//
//  Created by Mateusz Mirkowski on 16/05/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import Foundation

extension String {
  
  var utf8Encoded: Data {
    return data(using: .utf8)!
  }
  
}
