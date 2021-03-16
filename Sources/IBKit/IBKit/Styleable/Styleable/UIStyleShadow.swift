//
//  UIStyleableShadow.swift
//  IBKit
//
//

import UIKit

protocol UIStyleShadow {
    var ibShadowColor: UIColor? { get set }
    var ibShadowOffset: CGSize { get set }
    var ibShadowRadius: CGFloat { get set }
}
