//
//  CountriesRequests.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import Alamofire

enum CountriesRequests: APIRequest {
    case all
    case regional

    var baseURL: URL? {
       URL(string: "https://restcountries.com")
    }
    
    var method: HTTPMethod {
        switch self {
        case .all, .regional:
            return .get
        }
    }

    var version: String {
        "/v3.1"
    }
    
    var path: String {
        switch self {
        case .all:
            return "/all"
        case .regional:
            return "/region/europe"
        }
    }
}
