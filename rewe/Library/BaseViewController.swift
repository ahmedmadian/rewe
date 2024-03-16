//
//  BaseViewController.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    // MARK: - Views

    private lazy var progressView = UIActivityIndicatorView(style: .large).with {
        view.addSubview($0)
        $0.autolayout().center()
    }

    // MARK: - init

    init() {
        super.init(nibName: nil, bundle: Bundle.main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Setup

    func setupView() {
        setupViewAppearance()
        setupViewLayout()
        setupBindings()
    }

    func setupViewAppearance() {
        view.backgroundColor = Assets.Colors.primaryBackground.color
    }

    func setupViewLayout() {
    }

    func setupBindings() {
        
    }
}


// MARK: - isLoading

extension Reactive where Base: BaseViewController {
    var isLoading: Binder<Bool> {
        return Binder(base, binding: { vc, active in
            if active {
                vc.showLoader()
            } else {
                vc.hideLoader()
            }
        })
    }
}

// MARK: - Show/Hide progress view

private extension BaseViewController {
    func showLoader() {
        view.bringSubviewToFront(progressView)
        progressView.isHidden = false
        progressView.startAnimating()
    }

    func hideLoader() {
        progressView.isHidden = true
        progressView.stopAnimating()
    }
}
