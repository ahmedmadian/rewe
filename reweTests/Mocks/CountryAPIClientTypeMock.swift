//
//  CountryAPIClientTypeMock.swift
//  reweTests
//
//  Created by Ahmed Madian on 16.03.24.
//

import RxSwift
import Swinject
@testable import rewe

class CountryAPIClientTypeMock: CountryAPIClientType {
    var getAllCountriesStub = Observable<[Country]>.just([])
    var getCountriesInRegionStub = Observable<[Country]>.just([])

    func getAllCountries() -> Observable<[Country]> {
        return getAllCountriesStub
    }

    func getCountries(in: Region) -> Observable<[Country]> {
        return getCountriesInRegionStub
    }
}

// MARK: - Mock Registration

extension CountryAPIClientTypeMock {
    class func registerMock() -> CountryAPIClientTypeMock {
        let instance = CountryAPIClientTypeMock()
        Container.test.register(CountryAPIClientType.self) { _ in return instance }
        return instance
    }
}
