//
//  CountryListTableViewSectionModel.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import RxDataSources

struct CountryListTableViewSectionModel {
    var items: [Country]
}

extension CountryListTableViewSectionModel: SectionModelType {
    typealias Item = Country

    init(original: CountryListTableViewSectionModel, items: [Item]) {
        self = original
        self.items = items
    }
}
