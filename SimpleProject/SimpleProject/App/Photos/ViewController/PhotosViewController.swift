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
import Kingfisher

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
  
  private var photosView: PhotosView {
    return view as! PhotosView
  }
  
  private func configureView() {
  }
  
  private func setupCollectionView() {
    photosView.photosCollectionView.registerCollectionViewCellClass(PhotoCell.self)
    photosView.photosCollectionView.delegate = self
  }
  
  private func setupRx() {
    viewModel.photosData.asObservable().bind(to: photosView.photosCollectionView.rx.items) { collectionView, row, item in
      let cell = collectionView.dequeueReusableCell(PhotoCell.self, indexPath: IndexPath(row: row, section: 0))
      cell.photoName.text = item.title!
      cell.photoImage.kf.setImage(with: URL(string: item.thumbUrl!))
      return cell
    }.disposed(by: disposeBag)
    
    viewModel.photosData.asObservable().subscribe() { [unowned self] (event) in
      if (event.element?.count)! > 0 {
        self.scrollToBottom()
        self.photosView.emptyListLabel.isHidden = true
      } else {
        self.photosView.emptyListLabel.isHidden = false
      }
    }.disposed(by: disposeBag)
    
    photosView.addButton.rx.tap
      .subscribe({ [unowned self] _ in
        self.viewModel.getPhoto(with: self.viewModel.currentPhotoId)
      }).disposed(by: disposeBag)
    
    photosView.clearButton.rx.tap
      .subscribe({ [unowned self] _ in
        self.viewModel.resetData()
      }).disposed(by: disposeBag)
  }
  
  private func scrollToBottom() {
    let lastItemIndex = IndexPath(item: viewModel.photosData.value.count-1, section: 0)
    photosView.photosCollectionView.scrollToItem(at: lastItemIndex, at: UICollectionViewScrollPosition.top, animated: true)
  }

}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: photosView.frame.size.width/2-15, height: 220)
  }
}
