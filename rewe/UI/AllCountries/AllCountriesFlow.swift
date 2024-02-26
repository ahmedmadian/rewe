//
//  AllCountriesFlow.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import RxFlow
import Swinject

class AllCountriesFlow {
    private let rootViewController: AllCountriesViewController = Container.main.resolve(AllCountriesViewController.self)
}

// MARK: - Flow

extension AllCountriesFlow: Flow {
    var root: Presentable {
        rootViewController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        return .none
    }
}
