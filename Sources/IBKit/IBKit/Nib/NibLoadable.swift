//
//  NibLoadable.swift
//  IBKit
//
//

#if os(OSX)

import Cocoa

public protocol NibLoadable: Nib {
    
    static func loadFromNib<T>() -> T where T: NSView
    static func loadFromNib<T>(owner: Any?) -> T where T: NSView
}

extension NibLoadable {
    
    public static func loadFromNib<T>() -> T where T: NSResponder {
        return self.loadFromNib(owner: nil)
    }
    
    public static func loadFromNib<T>(owner: Any? = nil) -> T where T: NSResponder {
        var objs: NSArray?
        self.nib.instantiate(withOwner: owner, topLevelObjects: &objs)
        return objs?.first(where: { $0 is T }) as! T
    }
}


#else

import UIKit

public protocol NibLoadable: Nib {

    static func loadFromNib<T>() -> T where T: UIView
    static func loadFromNib<T>(owner: Any?) -> T where T: UIView
}

extension NibLoadable {
    
    public static func loadFromNib<T>() -> T where T: UIView {
        return self.loadFromNib(owner: nil)
    }
    
    public static func loadFromNib<T>(owner: Any? = nil) -> T where T: UIView {
        return self.nib.instantiate(withOwner: owner, options: nil).first as! T
    }
}

#endif
