//
//  APIRequest.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import Alamofire

protocol APIRequest {
    var baseURL: URL? { get }
    var method: HTTPMethod { get }
    var version: String { get }
    var path: String { get }
}

extension APIRequest {
    func request() -> URLRequest {
        var urlRequest = URLRequest(url: buildURL())
        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        urlRequest.httpShouldHandleCookies = false
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        urlRequest.method = method

        return urlRequest
    }

    private func buildURL() -> URL {
        guard let baseURL = baseURL else {
            fatalError("💥 Base URL is missing! 💥")
        }

        var url = baseURL
        
        if !version.isEmpty {
            url = baseURL.appendingPathComponent(version)
        }

        if !path.isEmpty {
            url = url.appendingPathComponent(path)
        }

        return url
    }
}
