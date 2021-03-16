//
//  IBView.swift
//  IBKit
//
//

import UIKit

@IBDesignable
open class IBView: UIView, UIStyleShadow, UIStyleBorder, UIStyleAccessibility {

    @IBInspectable var ibCornerRadius: CGFloat = 0
    @IBInspectable var ibBorderColor: UIColor?
    @IBInspectable var ibBorderWidth: CGFloat = 0
    @IBInspectable var ibAccessibilityIdentifier: String?
    @IBInspectable var ibShadowColor: UIColor?
    @IBInspectable var ibShadowOffset: CGSize = .zero
    @IBInspectable var ibShadowRadius: CGFloat = 0
    
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

private extension IBView {
    
    func applyIBSetup() {
        self.ib.applyIBStyle(styles: [.cornerRadius(radius: self.ibCornerRadius),
                                      .border(width: self.ibBorderWidth, color: self.ibBorderColor),
                                      .shadow(offset: self.ibShadowOffset, radius: self.ibShadowRadius, color: self.ibShadowColor),
                                      .accessibilityIdentifier(identifier: self.ibAccessibilityIdentifier)])
    }
}
