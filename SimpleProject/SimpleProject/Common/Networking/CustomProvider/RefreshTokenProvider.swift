//
//  RefreshTokenProvider.swift
//  Move Sandbox
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
//        if response.statusCode == 403 {
//          return self.refreshProvider.rx.request(.refreshToken)
//            .map({ (response) -> Response in
//              if response.statusCode == 403 {
////                UIApplication.topViewController()?.present(LoginViewController(viewModel: LoginViewModel()), animated: true, completion: nil)
////                TokenManagerDeleter.deleteTokens()
//              }
//              return response
//            })
//            .map(to: Token.self, keyPath: "data")
//            .do(onNext: { data  in
////              TokenManagerSaver.saveAccessToken(with: data.accessToken!)
////              TokenManagerSaver.saveRefreshToken(with: data.refreshToken!)
//            }).flatMap { _ in
//              return self.request(token) //retry the previous connection
//          }
//        } else if response.statusCode == 500 {
////          Toast(text: Localized.serverError500.string, delay: 3.5, duration: Delay.short).show()
//          return Single.just(response)
//        } else {
//          return Single.just(response)
//        }
        return Single.just(response)
      })
  }

}
