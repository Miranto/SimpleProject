//
//  PhotoCell.swift
//  SimpleProject
//
//  Created by Mateusz Mirkowski on 10/06/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
  
  // MARK: Initalizer
  
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
  
  lazy var containerView: UIView = {
    let view = UIView.makeView(with: Constants.UI.Color.baseVeryLightGrey)
    view.layer.borderColor = Constants.UI.Color.baseMediumGrey.cgColor
    view.layer.borderWidth = 1.0
    view.layer.cornerRadius = 12
    return view
  }()
  var photoName = UILabel.makeLabel(color: Constants.UI.Color.baseBlack, font: Font.central2book, size: 10, alignment: .left)
  var photoImage = UIImageView.makeImageView(with: nil)
  
  private func setupView() {
    backgroundColor = Constants.UI.Color.baseClear
  }
  
  private func addSubviews() {
    contentView.addSubview(containerView)
    containerView.addSubview(photoImage)
    containerView.addSubview(photoName)
  }
  
  private func setupLayout() {
    contentView.snp.makeConstraints { (make) in
      make.top.equalTo(0)
      make.left.equalTo(0)
      make.right.equalTo(0)
      make.bottom.equalTo(0)
    }
    
    containerView.snp.makeConstraints { (make) in
      make.top.equalTo(0)
      make.left.equalTo(0)
      make.right.equalTo(0)
      make.bottom.equalTo(Constants.UI.Padding.baseContainerBottomPadding)
    }
    
    photoImage.snp.makeConstraints { (make) in
      make.top.equalTo(15)
      make.centerX.equalTo(self.snp.centerX)
      make.left.equalTo(15)
      make.right.equalTo(-15)
      make.bottom.equalTo(photoName.snp.top).offset(-10)
    }
    
    photoName.snp.makeConstraints { (make) in
      make.left.equalTo(15)
      make.right.equalTo(-5)
      make.bottom.equalTo(-10)
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
  
}
