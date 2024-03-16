//
//  CountriesViewModelTypes.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import RxRelay
import RxFlow

protocol CountriesViewModelType {
    var input: CountriesViewModelInputType { get }
    var output: CountriesViewModelOutputType { get }
}

protocol CountriesViewModelInputType {
    var viewDidLoad: PublishRelay<Void> { get }
    var selectedCountry: PublishRelay<Country> { get }
}

protocol CountriesViewModelOutputType: Stepper {
    var viewState:PublishRelay<ViewState> { get }
    var countries: PublishRelay<[Country]> { get }
}
