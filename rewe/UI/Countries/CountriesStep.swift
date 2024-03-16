//
//  CountriesStep.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import RxFlow

// MARK: - Flow Steps

enum CountriesStep: Step, Equatable {
    case countries(Region)
    case countryDetails(Country)
    case error(String)
    case close
}
