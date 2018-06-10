//
//  NoInternetValidator.swift
//  Simple Project
//
//  Created by Mateusz Mirkowski on 12/02/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import Foundation
import Moya
import Result

class InternetConnectionValidatorPlugin: PluginType {
  
  func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    let url = URL(string: target.baseURL.absoluteString + target.path)
    var newRequest = request
    newRequest.url = url
    return newRequest
  }
  
  func willSend(_ request: RequestType, target: TargetType) {
//    let activityData = ActivityData()
//    
//    NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
  }
  
  func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
    switch(result) {
    case .success(let response):
      print(response.description)
      break

    case .failure(let error):
      print(error.errorDescription ?? "No description provided")
      if let errorDescription = error.errorDescription {
        if errorDescription == "The Internet connection appears to be offline." {
          // TODO: show alert
        } else {
         // TODO: show alert
        }
      }
      
    }
  }
}
