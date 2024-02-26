//
//  APIServices+Injection.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import Swinject

extension Container {
    func registerAPIServices() {
        register(CountryAPIClientType.self) { _ in return CountryAPIClient() }
    }
}
