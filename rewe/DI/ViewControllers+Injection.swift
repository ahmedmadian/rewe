//
//  ViewControllers+Injection.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import Swinject

extension Container {
    func registerViewControllers() {
        register(HomeTabBarController.self) { _ in return HomeTabBarController() }

        register(CountriesViewType.self) { (resolver: Resolver, region: Region) in
            let viewModel: CountriesViewModelType = resolver.resolve(CountriesViewModelType.self, argument: region)
            return CountriesViewController(viewModel: viewModel)
        }

        register(CountryDetailsViewType.self) { (resolver: Resolver, country: Country) in
            let viewModel: CountryDetailsViewModelType = resolver.resolve(CountryDetailsViewModelType.self, argument: country)
            return CountryDetailsViewController(viewModel: viewModel)
        }
    }
}
