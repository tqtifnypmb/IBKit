//
//  IBLabel.swift
//  IBKit
//
//

import UIKit

@IBDesignable
open class IBLabel: UILabel, UIStyleLocalizable, UIStyleAccessibility {

    @IBInspectable var ibAccessibilityIdentifier: String?
    @IBInspectable var ibLocalizableText: String?
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        self.applyIBSetup()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.applyIBSetup()
    }
}

// MARK: - Apply IB setup

private extension IBLabel {
    
    func applyIBSetup() {
        self.ib.applyIBStyle(styles: [.accessibilityIdentifier(identifier: self.ibAccessibilityIdentifier),
                                      .localizableText(key: self.ibLocalizableText)])
    }
}
