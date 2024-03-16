//
//  CountriesViewController.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import UIKit
import RxDataSources
import RxSwift

// MARK: - CountriesViewType

protocol CountriesViewType where Self: CountriesViewController {
    init(viewModel: CountriesViewModelType)
}

// MARK: - CountriesViewController

class CountriesViewController: BaseViewController, CountriesViewType {
    // MARK: - Views

    private lazy var tableView = UITableView(frame: .zero, style: .plain).with {
        $0.separatorStyle = .none
        $0.backgroundColor = Assets.Colors.primaryBackground.color
        CountryTableViewCell.registerIn(tableView: $0)
        $0.contentInset = UIEdgeInsets(top: DesignConstants.Padding.medium,
                                       left: .zero,
                                       bottom: DesignConstants.Padding.medium,
                                       right: .zero)
    }

    private lazy var tableViewDataSource = RxTableViewSectionedReloadDataSource<CountryListTableViewSectionModel>(configureCell: setupTableViewCells())

    private let disposeBag = DisposeBag()

    let viewModel: CountriesViewModelType

    // MARK: - Init

    required init(viewModel: CountriesViewModelType) {
        self.viewModel = viewModel

        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.input.viewDidLoad.accept(())
    }

    // MARK: - View Setup

    override func setupViewLayout() {
        super.setupViewLayout()

        view.addSubview(tableView)
        tableView.autolayout().pinToSuperview()
    }

    // MARK: - Bindings

    override func setupBindings() {
        super.setupBindings()

        viewToViewModelBindings()
        viewModelToViewBindings()

        func viewToViewModelBindings() {
            tableView.rx.modelSelected(Country.self)
                .bind(to: viewModel.input.selectedCountry)
                .disposed(by: disposeBag)
        }

        func viewModelToViewBindings() {
            viewModel.output.viewState
                .map { $0 == .loading }
                .bind(to: rx.isLoading)
                .disposed(by: disposeBag)

            viewModel.output.viewState
                .map { $0 == .error || $0 == .loading }
                .bind(to: tableView.rx.isHidden)
                .disposed(by: disposeBag)

            viewModel.output.countries
                .map { [CountryListTableViewSectionModel(items: $0)] }
                .bind(to: tableView.rx.items(dataSource: tableViewDataSource))
                .disposed(by: disposeBag)
        }
    }

    private func setupTableViewCells() -> RxTableViewSectionedReloadDataSource<CountryListTableViewSectionModel>.ConfigureCell {
        return { _, tableView, indexPath, item in
            let cell = CountryTableViewCell.dequeueIn(tableView: tableView, indexPath: indexPath)
            cell.config(with: item)
            return cell
        }
    }
}
