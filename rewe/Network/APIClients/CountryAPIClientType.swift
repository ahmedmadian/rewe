//
//  CountryAPIClientType.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import RxSwift

protocol CountryAPIClientType {
    func getAllCountries() -> Observable<[Country]>
    func getRegionalCountries() -> Observable<[Country]>
}

class CountryAPIClient: CountryAPIClientType, APIClient {
    typealias RequestType = CountriesRequests

    func getAllCountries() -> Observable<[Country]> {
        return execute(apiRequest: .all)
    }

    func getRegionalCountries() -> Observable<[Country]> {
        return execute(apiRequest: .regional)
    }
}
