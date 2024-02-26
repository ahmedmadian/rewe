//
//  HomeFlow.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import RxFlow
import Swinject

class HomeFlow {
    private let rootViewController: HomeTabBarController = Container.main.resolve(HomeTabBarController.self)
}

// MARK: - Flow

extension HomeFlow: Flow {
    var root: Presentable {
        rootViewController
    }

    func navigate(to step: Step) -> FlowContributors {
        let allCountriesFlow: AllCountriesFlow = Container.main.resolve(AllCountriesFlow.self)
        let regionalCountriesFlow: RegionalCountriesFlow = Container.main.resolve(RegionalCountriesFlow.self)

        Flows.use(allCountriesFlow, regionalCountriesFlow, when: .created) { [weak self] (root1: AllCountriesViewController, root2: RegionalCountriesViewController) in

            self?.rootViewController.setViewControllers([root1, root2], animated: false)
        }

        return .multiple(flowContributors: [.contribute(withNextPresentable: allCountriesFlow,
                                                        withNextStepper: DefaultStepper()),
                                            .contribute(withNextPresentable: regionalCountriesFlow,
                                                        withNextStepper: DefaultStepper())])
    }
}
