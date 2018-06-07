//
//  Localized.swift
//  Move Sandbox
//
//  Created by Mateusz Mirkowski on 11/05/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import Foundation

enum Localized: String {
  case ok
  case error
  
  case tilllate
  
  // Menu
  case welcome
  case events
  case venues
  case artists
  case FAQ
  
  case logIn                      = "log_in"
  case signUp                     = "sign_up"
  
  // Venues List
  case music
  
  var string: String {
    return NSLocalizedString(self.rawValue, tableName: nil, bundle: Bundle.main, value: "", comment: "")
  }
}
