//
//  File.swift
//  SimpleProject
//
//  Created by Mateusz Mirkowski on 07/06/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import UIKit
import SnapKit

class PhotosView: UIView {
  
  // MARK: Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
    addSubviews()
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Properties
  
  let photosCollectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.backgroundColor = Constants.UI.Color.baseClear
    return collectionView
  }()
  
  let addButton = UIButton.makeButton(with: "Add", textColor: Constants.UI.Color.baseDarkGrey, font: Font.central2book, asset: nil)
  let clearButton = UIButton.makeButton(with: "Clear", textColor: Constants.UI.Color.baseDarkGrey, font: Font.central2book, asset: nil)
}

extension PhotosView: BasicView {
  
  func setupView() {
    backgroundColor = Constants.UI.Color.baseWhite
  }
  
  func addSubviews() {
    addSubview(photosCollectionView)
    addSubview(addButton)
    addSubview(clearButton)
  }
  
  func setupLayout() {
    photosCollectionView.snp.makeConstraints { (make) in
      make.top.left.right.equalTo(0)
      make.bottom.equalTo(-80)
    }
    
    addButton.snp.makeConstraints { (make) in
      make.centerX.equalTo(snp.centerX).multipliedBy(0.5)
      make.width.equalTo(80)
      make.height.equalTo(40)
      make.bottom.equalTo(-10)
    }
    
    clearButton.snp.makeConstraints { (make) in
      make.centerX.equalTo(snp.centerX).multipliedBy(1.5)
      make.width.equalTo(80)
      make.height.equalTo(40)
      make.bottom.equalTo(-10)
    }
  }
  
}
