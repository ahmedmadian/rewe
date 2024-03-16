//
//  CountriesRequests.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import Alamofire

enum CountriesRequests: APIRequest {
    case countries(Region)

    var baseURL: URL? {
       URL(string: "https://restcountries.com")
    }
    
    var method: HTTPMethod {
        switch self {
        case .countries:
            return .get
        }
    }

    var version: String {
        "/v3.1"
    }
    
    var path: String {
        switch self {
        case .countries(let region):
            switch region {
            case .all:
                return "/all"
            default:
                return "/region/".appending(region.rawValue.lowercased())
            }
        }
    }
}
