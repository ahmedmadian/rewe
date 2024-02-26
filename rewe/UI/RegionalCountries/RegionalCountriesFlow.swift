//
//  RegionalCountriesFlow.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import RxFlow
import Swinject

class RegionalCountriesFlow {
    private let rootViewController: RegionalCountriesViewController = Container.main.resolve(RegionalCountriesViewController.self)
}

// MARK: - Flow

extension RegionalCountriesFlow: Flow {
    var root: Presentable {
        rootViewController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        return .none
    }
}
