//
//  IBTextField.swift
//  IBKit
//
//

import UIKit

open class IBTextField: UITextField, UIStyleAccessibility, UIStylePlaceholder {

    @IBInspectable var ibAccessibilityIdentifier: String?
    @IBInspectable var ibLocalizablePlaceholderText: String?
    @IBInspectable var ibPlaceholderTextColor: UIColor?
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        self.applyIBSetup()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.applyIBSetup()
    }

}

private extension IBTextField {
    
    func applyIBSetup() {
        self.ib.applyIBStyle(styles: [.localizablePlaceHolder(key: self.ibLocalizablePlaceholderText, color: self.ibPlaceholderTextColor),
                                      .accessibilityIdentifier(identifier: self.ibAccessibilityIdentifier)])
    }
}
