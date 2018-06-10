//
//  Localized.swift
//  Simple Project
//
//  Created by Mateusz Mirkowski on 11/05/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import Foundation

enum Localized: String {
  case ok
  case error
  
  case add
  case clear
  
  var string: String {
    return NSLocalizedString(self.rawValue, tableName: nil, bundle: Bundle.main, value: "", comment: "")
  }
}
