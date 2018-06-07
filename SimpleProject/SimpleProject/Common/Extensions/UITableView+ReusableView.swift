//
//  UIView+ReusableView.swift
//  Move Sandbox
//
//  Created by Mateusz Mirkowski on 21/11/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

public extension UITableViewCell {
  
  static var classNameReuseIdentifier: String {
    return "\(self)"
  }
  
  class func registerTableViewCell(tableView:UITableView, reuseIdentifier:String) {
    let nib =   UINib(nibName: classNameReuseIdentifier , bundle: Bundle(for: self))
    
    tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
  }
  
//  func hideKeyboard() {
//    let tap: UITapGestureRecognizer = UITapGestureRecognizer(
//      target: self,
//      action: #selector(UITableViewCell.dismissKeyboard))
//    
//    self.addGestureRecognizer(tap)
//  }
//  
//  @objc func dismissKeyboard() {
//    self.endEditing(true)
//  }
}

public protocol ReusableView {}

public extension ReusableView where Self: UIView {
  
  static var reuseIdentifier: String {
    return String(describing: self)
  }
  
}

extension UITableViewCell: ReusableView {}

public extension UITableView {
  
  func register<T: UITableViewCell>(_: T.Type) where T: NibLoadableView {
    
    let nib = UINib(nibName: T.NibName, bundle: Bundle(for: T.self))
    register(nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
}

public extension UICollectionViewCell {
  
  static var classNameReuseIdentifier: String {
    return "\(self)"
  }
  
  class func registerCollectionViewCell(collectionView:UICollectionView, reuseIdentifier:String) {
    let nib =   UINib(nibName: classNameReuseIdentifier , bundle: Bundle(for: self))
    
//    collectionView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
  }
  
  //  func hideKeyboard() {
  //    let tap: UITapGestureRecognizer = UITapGestureRecognizer(
  //      target: self,
  //      action: #selector(UITableViewCell.dismissKeyboard))
  //
  //    self.addGestureRecognizer(tap)
  //  }
  //
  //  @objc func dismissKeyboard() {
  //    self.endEditing(true)
  //  }
}

extension UICollectionViewCell: ReusableView {}

public extension UICollectionView {
  
  func register<T: UICollectionViewCell>(_: T.Type) where T: NibLoadableView {
    
    let nib = UINib(nibName: T.NibName, bundle: Bundle(for: T.self))
    register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
  }
}


public protocol NibLoadableView: class { }

public extension NibLoadableView where Self: UIView {
  
  static var NibName: String {
    return String(describing: self)
  }
}
