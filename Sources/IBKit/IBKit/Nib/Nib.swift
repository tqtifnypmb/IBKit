//
//  Nib.swift
//  IBKit
//
//

#if os(OSX)

import Cocoa

public typealias NibType = NSNib

#else

import UIKit

public typealias NibType = UINib

#endif

public protocol Nib: class {
    static var nib: NibType { get }
}

#if os(OSX)

extension Nib {
    
    public static var nib: NibType {
        return NSNib(nibNamed: String(describing: self), bundle: Bundle(for: self))!
    }
}

#else

extension Nib {
    
    public static var nib: NibType {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

#endif
