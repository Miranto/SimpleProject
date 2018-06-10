//
//  PhotosViewModel.swift
//  SimpleProject
//
//  Created by Mateusz Mirkowski on 07/06/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import Moya
import Moya_ModelMapper
import RxSwift

protocol PhotosViewModelType {
  var disposeBag: DisposeBag { get }
  var currentPhotoId: Int { get }
  var photosData: Variable<[Photo]> { get set }
  var photosProvider: RefreshTokenProvider<PhotosService> { get }
  func getPhoto(with id: Int)
}

final class PhotosViewModel: PhotosViewModelType {
  var disposeBag: DisposeBag = DisposeBag()
  var currentPhotoId: Int = 0
  var photosData: Variable<[Photo]> = Variable<[Photo]>([])
  var photosProvider = RefreshTokenProvider<PhotosService>()
  func getPhoto(with id: Int) {
    currentPhotoId += 1
    photosProvider.rx.request(.getPhoto(id: currentPhotoId))
      .map(to: Photo.self)
      .subscribe { event in
        switch event {
        case .success(let photo):
          print("iddd")
          print(photo.id!)
//          self.categoriesData.value = newCategories
        case .error(let error):
          let err = error as? MoyaError
          print(err?.response?.statusCode ?? "no error")
        }
      }.disposed(by: disposeBag)
  }
  
  
}
