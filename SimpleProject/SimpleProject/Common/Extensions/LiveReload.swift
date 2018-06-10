//
//  LiveReload.swift
//  Simple Project
//
//  Created by Mateusz Mirkowski on 01/02/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import Foundation

extension NSObject {
  
  func liveReload(_ callback: @escaping () -> Void) {
    _ = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "INJECTION_BUNDLE_NOTIFICATION"),
                                               object: nil,
                                               queue: nil) { _ in
                                                callback()
    }
  }
  
}
