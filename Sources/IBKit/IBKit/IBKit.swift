//
//  IBKit.swift
//  IBKit
//
//

public struct IB<Base> {
    public let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
}

public protocol IBCompatible {
    associatedtype IBBase
    
    static var ib: IB<IBBase>.Type { get }
    var ib: IB<IBBase> { get }
}

extension IBCompatible {
    
    public static var ib: IB<Self>.Type {
        return IB<Self>.self
    }
    
    public var ib: IB<Self> {
        return IB(self)
    }
}

import class UIKit.UIView

extension UIView: IBCompatible { }
extension String: IBCompatible { }
