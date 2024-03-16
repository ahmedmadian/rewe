//
//  ObjectWithable.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import Foundation

protocol ObjectWithable: AnyObject {
    associatedtype T

    @discardableResult func with(_ closure: (_ instance: T) -> Void) -> T
}

extension ObjectWithable {
    @discardableResult func with(_ closure: (_ instance: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: ObjectWithable {}
