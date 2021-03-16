//
//  IBButton.swift
//  IBKit
//
//

import UIKit

@IBDesignable
open class IBButton: UIButton, UIStyleLocalizable, UIStyleBorder, UIStyleShadow, UIStyleAccessibility {

    @IBInspectable var ibLocalizableText: String?
    @IBInspectable var ibCornerRadius: CGFloat = 0
    @IBInspectable var ibBorderColor: UIColor?
    @IBInspectable var ibBorderWidth: CGFloat = 0
    @IBInspectable var ibShadowColor: UIColor?
    @IBInspectable var ibShadowOffset: CGSize = .zero
    @IBInspectable var ibShadowRadius: CGFloat = 0
    @IBInspectable var ibAccessibilityIdentifier: String?
    
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

private extension IBButton {
    
    func applyIBSetup() {
        self.ib.applyIBStyle(styles: [.cornerRadius(radius: self.ibCornerRadius),
                                      .localizableText(key: self.ibLocalizableText),
                                      .shadow(offset: self.ibShadowOffset, radius: self.ibShadowRadius, color: self.ibShadowColor),
                                      .border(width: self.ibBorderWidth, color: self.ibBorderColor),
                                      .accessibilityIdentifier(identifier: self.ibAccessibilityIdentifier)])
    }
}
