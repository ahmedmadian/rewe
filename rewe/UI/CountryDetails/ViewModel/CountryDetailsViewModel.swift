//
//  CountryDetailsViewModel.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import RxSwift
import RxRelay
import RxFlow

class CountryDetailsViewModel: CountryDetailsViewModelType {
    // MARK: - Input

    struct ViewModelInput: CountryDetailsViewModelInputType {
        let viewDidLoad = PublishRelay<Void>()
        let close = PublishRelay<Void>()
    }

    // MARK: - Output

    struct ViewModelOutput: CountryDetailsViewModelOutputType {
        let navigationTitle = PublishRelay<String>()
        let countryImageURL = PublishRelay<URL?>()
        let countryDetailsSections = PublishRelay<[CountryDetailsSectionModel]>()
        let steps = PublishRelay<Step>()
    }

    private let country: Country
    private let disposeBag = DisposeBag()

    let input: CountryDetailsViewModelInputType
    let output: CountryDetailsViewModelOutputType

    // MARK: - Init

    init(country: Country) {
        self.country = country
        input = ViewModelInput()
        output = ViewModelOutput()

        setupBindings()
    }

    // MARK: - Bindings

    private func setupBindings() {
        input.viewDidLoad.subscribe(onNext: { [weak self] in
            guard let self else { return }

            self.configureView(with: self.country)
        }).disposed(by: disposeBag)

        input.close.map { CountriesStep.close }
            .bind(to: output.steps)
            .disposed(by: disposeBag)
    }

    // MARK: - Private Methods

    private func configureView(with country: Country) {
        output.navigationTitle.accept(country.name.common)
        output.countryImageURL.accept(URL(string: country.flags.png))
        output.countryDetailsSections.accept(generateDetailsSections(for: country))
    }

    private func generateDetailsSections(for country: Country) -> [CountryDetailsSectionModel] {
        var items = [
            CountryDetailsItemModel(itemType: .officialName, subtitle: country.name.official),
            CountryDetailsItemModel(itemType: .commonName, subtitle: country.name.common),
            CountryDetailsItemModel(itemType: .population, subtitle: String(country.population)),
            CountryDetailsItemModel(itemType: .region, subtitle: country.region.rawValue)
        ]

        if let capitals = country.capital {
            items.append(CountryDetailsItemModel(itemType: .capital, subtitle: capitals.joined(separator: ", ")))
        }

        return [CountryDetailsSectionModel(items: items)]
    }
}
