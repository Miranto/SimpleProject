//
//  Constants.swift
//  Simple Project
//
//  Created by Mateusz Mirkowski on 21/11/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

enum Constants {
  enum UI {
    struct Color {
      static let baseWhite          = UIColor(redValue: 255, greenValue: 255, blueValue: 255, alpha: 1.0)
      static let baseDarkGrey       = UIColor(redValue: 56, greenValue: 56, blueValue: 56, alpha: 1.0)
      static let baseMediumGrey     = UIColor(redValue: 155, greenValue: 155, blueValue: 155, alpha: 1.0)
      static let baseLightGrey      = UIColor(redValue: 170, greenValue: 182, blueValue: 195, alpha: 1.0)
      static let baseVeryLightGrey  = UIColor(redValue: 246, greenValue: 247, blueValue: 249, alpha: 1.0)
      static let baseYellow         = UIColor(redValue: 255, greenValue: 215, blueValue: 64, alpha: 1.0)
      static let baseBlack          = UIColor(redValue: 0, greenValue: 0, blueValue: 0, alpha: 1.0)
      static let baseClear          = UIColor(redValue: 0, greenValue: 0, blueValue: 0, alpha: 0.0)
    }
    struct Padding {
      static var baseTopPadding: CGFloat {
        get {
          if UIScreen.main.nativeBounds.height == 2436 {
            return 100
          } else {
           return 80
          }
        }
      }
      static var baseTopPaddingNoSegmentedControl: CGFloat {
        get {
          if UIScreen.main.nativeBounds.height == 2436 {
            return 85
          } else {
            return 65
          }
        }
      }
      static let basePadding = 54.0
      static let buttonPadding = 46.0
      static let baseContainerBottomPadding = -20
      static let baseListBottomPadding = 0
    }
    struct Size {
      static let inputHeight = 48.0
      static let buttonHeight = 55.0
    }
    struct Device {
      static let type = UIScreen.main.traitCollection.userInterfaceIdiom
    }
//    struct AttributedString {
//      static let 
//    }
  }
  struct Networking {
    static let baseURL = Common.isDev ? "https://jsonplaceholder.typicode.com" : "https://jsonplaceholder.typicode.com"
    static let baseImageURL = Common.isDev ? "https://dev.example.com" : "https://example.com"
  }
  struct TokenManager {
    static let accessToken = "accessToken"
    static let refreshToken = "refreshToken"
    static let userId = "userId"
    static let isUserLogged = "isUserLogged"
    static let deviceToken = "deviceToken"
  }
  struct Common {
    static let isDev = true
  }
}
