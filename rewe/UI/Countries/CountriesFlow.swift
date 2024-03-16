//
//  CountriesFlow.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import RxFlow
import Swinject

class CountriesFlow {
    private let rootViewController = UINavigationController()
}

// MARK: - Flow

extension CountriesFlow: Flow {
    var root: Presentable {
        rootViewController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let countriesStep = step as? CountriesStep else { return .none }

        switch countriesStep {
        case .countries(let region):
            return navigateToCountries(in: region)
        case .countryDetails(let country):
            return navigateToCountryDetails(with: country)
        case .error(let errorMessage):
            return navigateToAlertScreen(message: errorMessage)
        case .close:
            rootViewController.presentedViewController?.dismiss(animated: true)
            return .none
        }
    }

    private func navigateToCountries(in region: Region) -> FlowContributors {
        let viewController: CountriesViewController = Container.main.resolve(CountriesViewType.self,
                                                                             argument: region)
        viewController.title = region.rawValue.uppercased()
        rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: rootViewController,
                                                 withNextStepper: viewController.viewModel.output))
    }

    private func navigateToCountryDetails(with country: Country) -> FlowContributors {
        let viewController: CountryDetailsViewController = Container.main.resolve(CountryDetailsViewType.self,
                                                                                  argument: country)
        rootViewController.present(UINavigationController(rootViewController: viewController), animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: viewController,
                                                 withNextStepper: viewController.viewModel.output))
    }

    private func navigateToAlertScreen(message: String) -> FlowContributors {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .cancel))
        rootViewController.present(alert, animated: true)
        return .none
    }
}
