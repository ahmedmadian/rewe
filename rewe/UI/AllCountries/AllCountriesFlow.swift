//
//  AllCountriesFlow.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import RxFlow

class AllCountriesFlow {
    private let rootViewController = AllCountriesViewController()
}

// MARK: - Flow

extension AllCountriesFlow: Flow {
    var root: RxFlow.Presentable {
        rootViewController
    }
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        return .none
    }
}
