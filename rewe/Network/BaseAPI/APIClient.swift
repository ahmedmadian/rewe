//
//  APIClient.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import RxSwift
import Alamofire

protocol APIClient: AnyObject {
    associatedtype RequestType: APIRequest
}

extension APIClient {
    func execute<Model: Codable>(apiRequest: RequestType) -> Observable<Model> {
        return Observable<Model>.create { observer in
           let request = AF.request(apiRequest.request())
                .responseDecodable(of: Model.self) { response in
                    switch response.result {
                    case .success(let decodedType):
                        observer.onNext(decodedType)
                    case .failure(let error):
                        observer.onError(error)
                    }
                }

            return Disposables.create {
                request.cancel()
            }
        }
    }
}
