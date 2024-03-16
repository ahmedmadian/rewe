//
//  CountriesViewModel.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import RxRelay
import RxSwift
import RxFlow

class CountriesViewModel: CountriesViewModelType {
    // MARK: - Input

    struct ViewModelInput: CountriesViewModelInputType {
        let viewDidLoad = PublishRelay<Void>()
        let selectedCountry = PublishRelay<Country>()
    }

    // MARK: - Output

    struct ViewModelOutput: CountriesViewModelOutputType {
        let viewState = PublishRelay<ViewState>()
        let countries = PublishRelay<[Country]>()
        let steps = PublishRelay<Step>()
    }

    private let apiClient: CountryAPIClientType
    private let region: Region
    private let disposeBag = DisposeBag()

    let input: CountriesViewModelInputType
    let output: CountriesViewModelOutputType

    // MARK: - init

    init(apiClient: CountryAPIClientType, region: Region) {
        self.apiClient = apiClient
        self.region = region
        input = ViewModelInput()
        output = ViewModelOutput()

        setupBindings()
    }

    // MARK: - Binidings

    private func setupBindings() {
        input.viewDidLoad.flatMapLatest { [weak self] in
            self?.output.viewState.accept(.loading)
            return self?.apiClient.getCountries(in: self?.region ?? .all) ?? .empty()
        }.subscribe(onNext: { [weak self] countries in
            self?.output.viewState.accept(.loaded)
            self?.output.countries.accept(countries)
        }, onError: { [weak self] error in
            self?.output.viewState.accept(.error)
            self?.output.steps.accept(CountriesStep.error(error.asAFError?.errorDescription ?? "Error fetching data"))
        }).disposed(by: disposeBag)

        input.selectedCountry
            .map { CountriesStep.countryDetails($0) }
            .bind(to: output.steps)
            .disposed(by: disposeBag)
    }
}
