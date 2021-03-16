//
//  String.swift
//  IBKit
//
//

import UIKit

public extension IB where Base == String {
    
    var localized: String {
        return NSLocalizedString(self.base, comment: self.base)
    }
}
