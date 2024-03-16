//
//  UITableViewCell+Registration.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import UIKit

extension UITableViewCell {
    class func registerIn(tableView: UITableView) {
        tableView.register(classForCoder(), forCellReuseIdentifier: "\(self.self)")
    }
}

extension UITableViewCell {
    class func dequeueIn(tableView: UITableView, indexPath: IndexPath) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(self.self)", for: indexPath) as? Self else {
            fatalError("Cell can't be dequeued!")
        }

        return cell
    }
}
