//
//  CountryDetailsItemModel.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import Foundation

struct CountryDetailsItemModel: Equatable {
    let title: String
    let subtitle: String

    init(itemType: CountryDetailsItemType, subtitle: String) {
        self.title = itemType.title
        self.subtitle = subtitle
    }
}

enum CountryDetailsItemType: Equatable, CaseIterable {
    case officialName
    case commonName
    case population
    case region
    case languages
    case capital

    var title: String {
        switch self {
        case .officialName:
            return "Official name"
        case .commonName:
            return "Common name"
        case .population:
            return "Population"
        case .region:
            return "Region"
        case .languages:
            return "Languages"
        case .capital:
            return "Capital"
        }
    }
}
