//
//  RefreshTokenProvider.swift
//  Simple Project
//
//  Created by Mateusz Mirkowski on 08/02/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import RxSwift
import Result

public class RefreshTokenProvider<Target>: MoyaProvider<Target> where Target: Moya.TargetType {

  private let disposeBag = DisposeBag()

//  let refreshProvider = MoyaProvider<RefreshTokenService>(plugins: [NetworkLoggerPlugin(verbose: true)])

  public init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
              requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider.defaultRequestMapping,
              stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub,
              manager: Manager = Alamofire.SessionManager.default,
              plugins: [PluginType] = []) {

    super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, manager: manager, plugins: [NetworkLoggerPlugin(verbose: true), InternetConnectionValidatorPlugin()])
  }

  func request(_ token: Target) -> Single<Moya.Response> {
    return self.rx.request(token)
      .flatMap({ (response) -> PrimitiveSequence<SingleTrait, Response> in
        return Single.just(response)
      })
  }

}
