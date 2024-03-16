//
//  CountryDetailsViewModelTypes.swift
//  rewe
//
//  Created by Ahmed Madian on 16.03.24.
//

import RxRelay
import RxFlow

protocol CountryDetailsViewModelType {
    var input: CountryDetailsViewModelInputType { get }
    var output: CountryDetailsViewModelOutputType { get }
}

protocol CountryDetailsViewModelInputType {
    var viewDidLoad: PublishRelay<Void> { get }
    var close: PublishRelay<Void> { get }
}

protocol CountryDetailsViewModelOutputType: Stepper {
    var navigationTitle: PublishRelay<String> { get }
    var countryImageURL: PublishRelay<URL?> { get }
    var countryDetailsSections: PublishRelay<[CountryDetailsSectionModel]> { get }
}
