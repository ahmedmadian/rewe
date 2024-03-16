//
//  CountryDetailsSectionModel.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import RxDataSources

struct CountryDetailsSectionModel {
    var items: [CountryDetailsItemModel]
}

extension CountryDetailsSectionModel: SectionModelType {
    typealias Item = CountryDetailsItemModel

    init(original _ : CountryDetailsSectionModel, items: [CountryDetailsItemModel]) {
        self.items = items
    }
}
