//
//  UICollectionView+Helpers.swift
//  Move Sandbox
//
//  Created by Mateusz Mirkowski on 15/12/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

extension UICollectionView {
  
  func registerCollectionViewCellClass<T: UICollectionViewCell>(_ tableViewCellClass: T.Type) {
    register(tableViewCellClass, forCellWithReuseIdentifier: tableViewCellClass.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(_ tableViewCellClass: T.Type, indexPath: IndexPath) -> T {
    print(tableViewCellClass)
    return (self.dequeueReusableCell(withReuseIdentifier: tableViewCellClass.reuseIdentifier, for: indexPath) as? T)!
  }
  
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: NSIndexPath) -> T {
    
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }
  
}
