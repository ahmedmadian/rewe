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
        let allCountriesFlow: CountriesFlow = Container.main.resolve(CountriesFlow.self)
        let regionalCountriesFlow: CountriesFlow = Container.main.resolve(CountriesFlow.self)

        Flows.use(allCountriesFlow, regionalCountriesFlow, when: .created) { [weak self] (root1: UINavigationController, root2: UINavigationController) in
            root1.tabBarItem = UITabBarItem(title: nil, image: Assets.Images.world.image, selectedImage: nil)
            root2.tabBarItem = UITabBarItem(title: nil, image: Assets.Images.europe.image, selectedImage: nil)
            self?.rootViewController.setViewControllers([root1, root2], animated: false)
        }

        return .multiple(flowContributors: [.contribute(withNextPresentable: allCountriesFlow,
                                                        withNextStepper: OneStepper(withSingleStep: CountriesStep.countries(.all))),
                                            .contribute(withNextPresentable: regionalCountriesFlow,
                                                        withNextStepper: OneStepper(withSingleStep: CountriesStep.countries(.europe)))])
    }
}
