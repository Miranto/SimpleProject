//
//  PhotosService.swift
//  SimpleProject
//
//  Created by Mateusz Mirkowski on 07/06/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import Foundation
import Moya

enum PhotosService {
  case getPhoto(id: Int)
}

extension PhotosService: TargetType {
  
  var baseURL: URL { return URL(string: Constants.Networking.baseURL)! }
  var path: String {
    switch self {
    case .getPhoto(let id):
      return "/photos/\(id)"
    }
  }
  var method: Moya.Method {
    switch self {
    case .getPhoto:
      return .get
    }
  }
  var task: Task {
    switch self {
    case .getPhoto:
      return .requestPlain
    }
  }
  var sampleData: Data {
    switch self {
    case .getPhoto:
      return "example".utf8Encoded
    }
  }
  var headers: [String: String]? {
    switch self {
    case .getPhoto:
      return ["Content-type": "application/json"]
    }
  }
  
}
