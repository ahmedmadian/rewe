//
//  ViewModels+Injection.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import Swinject

extension Container {
    func registerViewModels() {
        register(CountriesViewModelType.self) { resolver, region in
            let apiClient: CountryAPIClientType = resolver.resolve(CountryAPIClientType.self)
            return CountriesViewModel(apiClient: apiClient, region: region)
        }

        register(CountryDetailsViewModelType.self) { resolver, country in
            return CountryDetailsViewModel(country: country)
        }
    }
}
