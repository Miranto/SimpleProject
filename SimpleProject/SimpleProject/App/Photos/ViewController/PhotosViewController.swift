//
//  PhotosViewController.swift
//  SimpleProject
//
//  Created by Mateusz Mirkowski on 07/06/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PhotosViewController: UIViewController {
  
  private var viewModel: PhotosViewModelType
  private var disposeBag: DisposeBag = DisposeBag()
  
  // MARK: Initializers
  
  init(viewModel: PhotosViewModelType) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Lifecycles methods
  
  override func loadView() {
    view = PhotosView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    setupCollectionView()
    setupRx()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setAttributedTitle(with: Localized.music.string.capitalized)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setAttributedTitle(with: Localized.music.string.capitalized) // bug in ios 10, need to set title in viewDidAppear either
    //    venuesView.categoriesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  private var photosView: PhotosView {
    return view as! PhotosView
  }
  
  private func configureView() {
  }
  
  private func setupCollectionView() {
//    photosView.photosCollectionView.registerCollectionViewCellClass(VenueCategoryCollectionViewCell.self)
    photosView.photosCollectionView.delegate = self
  }
  
  private func setupRx() {
//    viewModel.categoriesData.asObservable().bind(to: photosView.photosCollectionView.rx.items) { collectionView, row, item in
//      let cell = collectionView.dequeueReusableCell(VenueCategoryCollectionViewCell.self, indexPath: IndexPath(row: row, section: 0))
//      cell.categoryButton.setTitle(item.name!, for: .normal)
//      item.selected ? cell.selectRow() : cell.deselectRow()
//      return cellK
//    }.disposed(by: disposeBag)
    
    photosView.addButton.rx.tap
      .subscribe({ [unowned self] _ in
        self.viewModel.getPhoto(with: self.viewModel.currentPhotoId)
      }).disposed(by: disposeBag)
  }

}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: photosView.frame.size.width/2-15, height: 150)
  }
}
