//
//  CountryAPIClient.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import RxSwift

protocol CountryAPIClientType {
    func getCountries(in: Region) -> Observable<[Country]>
}

class CountryAPIClient: CountryAPIClientType, APIClient {
    typealias RequestType = CountriesRequests

    func getCountries(in region: Region) -> Observable<[Country]> {
        return execute(apiRequest: .countries(region))
    }
}
