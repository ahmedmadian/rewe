//
//  AutoLayoutExtensions.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import UIKit

extension UIView {
    func autolayout() -> AutoLayout {
        return AutoLayout(view: self)
    }
}

class AutoLayout {
    let view: UIView

    init(view: UIView) {
        self.view = view
        self.view.translatesAutoresizingMaskIntoConstraints = false
    }

    @discardableResult
    func leading(to otherView: UIView, padding: CGFloat? = nil) -> AutoLayout {
        view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: padding ?? 0).isActive = true
        return self
    }

    @discardableResult
    func leading(to otherView: UIView, padding: CGFloat? = nil, equal: Bool = true) -> AutoLayout {
        if equal {
            view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: padding ?? 0).isActive = true
        } else {
            view.leadingAnchor.constraint(greaterThanOrEqualTo: otherView.leadingAnchor, constant: padding ?? 0).isActive = true
        }
        return self
    }

    @discardableResult
    func leadingToSuperview(padding: CGFloat? = nil) -> AutoLayout {
        if let superview = view.superview {
            return leading(to: superview, padding: padding)
        }
        return self
    }

    @discardableResult
    func after(_ otherView: UIView, padding: CGFloat? = nil) -> AutoLayout {
        view.leadingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: padding ?? 0).isActive = true
        return self
    }

    @discardableResult
    func before(_ otherView: UIView, padding: CGFloat? = nil) -> AutoLayout {
        view.trailingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: -(padding ?? 0)).isActive = true
        return self
    }

    @discardableResult
    func trailing(to otherView: UIView, padding: CGFloat? = nil, equal: Bool = true) -> AutoLayout {
        if equal {
            view.trailingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: -(padding ?? 0)).isActive = true
        } else {
            view.trailingAnchor.constraint(lessThanOrEqualTo: otherView.trailingAnchor, constant: -(padding ?? 0)).isActive = true
        }
        return self
    }

    @discardableResult
    func trailingToSuperview(padding: CGFloat? = nil) -> AutoLayout {
        if let superview = view.superview {
            return trailing(to: superview, padding: padding)
        }
        return self
    }

    @discardableResult
    func top(to otherView: UIView, padding: CGFloat? = nil, equal: Bool = true) -> AutoLayout {
        if equal {
            view.topAnchor.constraint(equalTo: otherView.topAnchor, constant: padding ?? 0).isActive = true
        } else {
            view.topAnchor.constraint(greaterThanOrEqualTo: otherView.topAnchor, constant: padding ?? 0).isActive = true
        }
        return self
    }

    @discardableResult
    func topToSuperview(padding: CGFloat? = nil) -> AutoLayout {
        if let superview = view.superview {
            return top(to: superview, padding: padding)
        }
        return self
    }

    @discardableResult
    func topToSafeSuperview(padding: CGFloat? = nil) -> AutoLayout {
        if let superview = view.superview {
            view.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: padding ?? 0).isActive = true
        }
        return self
    }

    @discardableResult
    func bottom(to otherView: UIView, padding: CGFloat? = nil, equal: Bool = true) -> AutoLayout {
        if equal {
            view.bottomAnchor.constraint(equalTo: otherView.bottomAnchor, constant: -(padding ?? 0)).isActive = true
        } else {
            view.bottomAnchor.constraint(lessThanOrEqualTo: otherView.bottomAnchor, constant: -(padding ?? 0)).isActive = true
        }
        return self
    }

    @discardableResult
    func bottomToSuperview(padding: CGFloat? = nil) -> AutoLayout {
        if let superview = view.superview {
            return bottom(to: superview, padding: padding)
        }
        return self
    }

    @discardableResult
    func bottomToSafeSuperview(padding: CGFloat? = nil) -> AutoLayout {
        if let superview = view.superview {
            view.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -(padding ?? 0)).isActive = true
        }
        return self
    }

    @discardableResult
    func below(of otherView: UIView, padding: CGFloat? = 0, equal: Bool = true) -> AutoLayout {
        if equal {
            view.topAnchor.constraint(equalTo: otherView.bottomAnchor, constant: padding ?? 0).isActive = true
        } else {
            view.topAnchor.constraint(greaterThanOrEqualTo: otherView.bottomAnchor, constant: padding ?? 0).isActive = true
        }
        return self
    }

    @discardableResult
    func above(of otherView: UIView, padding: CGFloat? = nil, equal: Bool = true) -> AutoLayout {
        if equal {
            view.bottomAnchor.constraint(equalTo: otherView.topAnchor, constant: -(padding ?? 0)).isActive = true
        } else {
            view.bottomAnchor.constraint(lessThanOrEqualTo: otherView.topAnchor, constant: -(padding ?? 0)).isActive = true
        }
        return self
    }

    @discardableResult
    func center(to otherView: UIView? = nil) -> AutoLayout {
        if let toView = getToView(otherView) {
            view.centerXAnchor.constraint(equalTo: toView.centerXAnchor, constant: 0).isActive = true
            view.centerYAnchor.constraint(equalTo: toView.centerYAnchor, constant: 0).isActive = true
        }
        return self
    }

    @discardableResult
    func centerX(to otherView: UIView? = nil, padding: CGFloat? = nil) -> AutoLayout {
        if let toView = getToView(otherView) {
            view.centerXAnchor.constraint(equalTo: toView.centerXAnchor, constant: padding ?? 0).isActive = true
        }
        return self
    }

    @discardableResult
    func centerY(to otherView: UIView? = nil, padding: CGFloat? = nil) -> AutoLayout {
        if let toView = getToView(otherView) {
            view.centerYAnchor.constraint(equalTo: toView.centerYAnchor, constant: padding ?? 0).isActive = true
        }
        return self
    }

    @discardableResult
    func widthEqual(to otherView: UIView, padding: CGFloat? = nil) -> AutoLayout {
        view.widthAnchor.constraint(equalTo: otherView.widthAnchor, constant: padding ?? 0).isActive = true
        return self
    }

    @discardableResult
    func widthEqual(toConstant constant: CGFloat) -> AutoLayout {
        view.widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func widthEqualToHeightMultiplier(multiplier: CGFloat) -> AutoLayout {
        view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
        return self
    }

    @discardableResult
    func heightEqual(to otherView: UIView, padding: CGFloat = 0.0) -> AutoLayout {
        view.heightAnchor.constraint(equalTo: otherView.heightAnchor, constant: padding).isActive = true
        return self
    }

    @discardableResult
    func heightLimit(of limit: CGFloat) -> AutoLayout {
        view.heightAnchor.constraint(lessThanOrEqualToConstant: limit).isActive = true
        return self
    }

    @discardableResult
    func widthLimit(of limit: CGFloat) -> AutoLayout {
        view.widthAnchor.constraint(lessThanOrEqualToConstant: limit).isActive = true
        return self
    }

    @discardableResult
    func heightEqual(to otherView: UIView, multiplier: CGFloat) -> AutoLayout {
        view.heightAnchor.constraint(equalTo: otherView.heightAnchor, multiplier: multiplier).isActive = true
        return self
    }

    @discardableResult
    func heightEqualToWidthMultiplier(multiplier: CGFloat) -> AutoLayout {
        view.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
        return self
    }

    @discardableResult
    func heightEqual(toConstant constant: CGFloat) -> AutoLayout {
        view.heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func heightLessThanOrEqual(toConstant constant: CGFloat) -> AutoLayout {
        view.heightAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func heightGreaterThanOrEqual(toConstant constant: CGFloat) -> AutoLayout {
        view.heightAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func widthGreaterThanOrEqual(toConstant constant: CGFloat) -> AutoLayout {
        view.widthAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func square(withSize size: CGFloat) -> AutoLayout {
        view.widthAnchor.constraint(equalToConstant: size).isActive = true
        view.heightAnchor.constraint(equalToConstant: size).isActive = true
        return self
    }

    @discardableResult
    func pinToSuperview(padding: CGFloat? = nil) -> AutoLayout {
        return topToSuperview(padding: padding).bottomToSuperview(padding: padding).leadingToSuperview(padding: padding).trailingToSuperview(padding: padding)
    }

    private func getToView(_ otherView: UIView?) -> UIView? {
        otherView == nil ? view.superview : otherView
    }
}
