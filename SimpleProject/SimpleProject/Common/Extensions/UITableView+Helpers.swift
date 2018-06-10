//
//  UITableView+Helpers.swift
//  Simple Project
//
//  Created by Mateusz Mirkowski on 21/11/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit


extension UITableView {
  
//  func register<T: UICollectionViewCell where T: ReusableView>(_: T.Type)
  
  func registerTableViewCellClass<T: UITableViewCell>(_ tableViewCellClass: T.Type)  {
    register(tableViewCellClass, forCellReuseIdentifier: tableViewCellClass.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(_ tableViewCellClass: T.Type) -> T {
    print(tableViewCellClass)
    return (self.dequeueReusableCell(withIdentifier: tableViewCellClass.reuseIdentifier) as? T)!
  }
  
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: NSIndexPath) -> T {
    
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }
  
  
  func hideSeparatorForEmptyCells() {
    tableFooterView = UIView(frame: .zero)
  }
  
  // allows e.g. immediate highligthed state of buttons in cells
  func disableContentTouchesDelay() {
    delaysContentTouches = false
    
    for case let scrollView as UIScrollView in subviews {
      scrollView.delaysContentTouches = false
    }
  }
  
//  func showAsBackground(text: String) {
//    backgroundView = TextBackgroundView(text: text)
//  }
  
  func hideBackground() {
    backgroundView = nil
  }
  
}

