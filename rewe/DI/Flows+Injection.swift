//
//  Flows+Injection.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import Swinject
import RxFlow

extension Container {
    func registerFlows() {
        register(HomeFlow.self) { _ in return HomeFlow() }
        register(CountriesFlow.self) { _ in return CountriesFlow() }
    }
}
