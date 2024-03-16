//
//  CountryDetailsViewController.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import UIKit
import RxDataSources
import RxSwift
import AlamofireImage

// MARK: - CountryDetailsViewType

protocol CountryDetailsViewType where Self: CountryDetailsViewController {
    init(viewModel: CountryDetailsViewModelType)
}

// MARK: - CountryDetailsViewController

class CountryDetailsViewController: BaseViewController, CountryDetailsViewType {
    // MARK: - Views

    private let flagImageView = UIImageView().with {
        $0.clipsToBounds = true
        $0.contentMode = .center
    }

    private let closeBarButton = UIBarButtonItem().with {
        $0.image = Assets.Images.icClose.image
    }

    private lazy var tableView = UITableView(frame: .zero, style: .plain).with {
        $0.separatorStyle = .none
        $0.backgroundColor = Assets.Colors.primaryBackground.color
        CountryDetailsItemTableViewCell.registerIn(tableView: $0)
        let headerView = flagImageView
        headerView.frame.size.height = 100
        $0.tableHeaderView = headerView
    }

    private lazy var tableViewDataSource = RxTableViewSectionedReloadDataSource<CountryDetailsSectionModel>(configureCell: setupTableViewCells())

    private let disposeBag = DisposeBag()

    let viewModel: CountryDetailsViewModelType

    // MARK: - init

    required init(viewModel: CountryDetailsViewModelType) {
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

    // MARK: - Setup

    override func setupViewLayout() {
        super.setupViewLayout()

        navigationItem.leftBarButtonItem = closeBarButton
        view.addSubview(tableView)
        tableView.autolayout().pinToSuperview()
    }
    
    override func setupBindings() {
        super.setupBindings()

        viewToViewModelBindings()
        viewModelToViewBindings()

        func viewToViewModelBindings() {
            closeBarButton.rx.tap
                .bind(to: viewModel.input.close)
                .disposed(by: disposeBag)
        }

        func viewModelToViewBindings() {
            viewModel.output.navigationTitle.subscribe(onNext: { [weak self] navigationTitle in
                self?.title = navigationTitle
            }).disposed(by: disposeBag)

            viewModel.output.countryImageURL.subscribe(onNext: { [weak self] url in
                guard let url else { return }

                self?.flagImageView.af.setImage(withURL: url,
                                                cacheKey: url.absoluteString,
                                                placeholderImage: UIImage(),
                                                imageTransition: .crossDissolve(0.3),
                                                runImageTransitionIfCached: false)
            }).disposed(by: disposeBag)

            viewModel.output.countryDetailsSections
                .bind(to: tableView.rx.items(dataSource: tableViewDataSource))
                .disposed(by: disposeBag)
        }
    }

    private func setupTableViewCells() -> RxTableViewSectionedReloadDataSource<CountryDetailsSectionModel>.ConfigureCell {
        return { _, tableView, indexPath, item in
            let cell = CountryDetailsItemTableViewCell.dequeueIn(tableView: tableView, indexPath: indexPath)
            cell.configCell(with: item)
            return cell
        }
    }
}
