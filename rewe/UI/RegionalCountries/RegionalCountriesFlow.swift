//
//  RegionalCountriesFlow.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import RxFlow

class RegionalCountriesFlow {
    private let rootViewController = RegionalCountriesViewController()
}

// MARK: - Flow

extension RegionalCountriesFlow: Flow {
    var root: RxFlow.Presentable {
        rootViewController
    }
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        return .none
    }
}
