//
//  UIStyleableView.swift
//  IBKit
//
//

import UIKit

enum IBStyle {
    case cornerRadius(radius: CGFloat)
    case border(width: CGFloat, color: UIColor?)
    case localizableText(key: String?)
    case localizablePlaceHolder(key: String?, color: UIColor?)
    case shadow(offset: CGSize, radius: CGFloat, color: UIColor?)
    case accessibilityIdentifier(identifier: String?)
}

extension IB where Base: UIView {
    
    func applyIBStyle(styles: [IBStyle]) {
        let hasShadow = styles.contains(where: { style in
            if case let .shadow(_, _, color) = style {
                if color == nil {
                    return false
                } else {
                    return true
                }
            } else {
                return false
            }
        })
        
        let hasCornerRadius = styles.contains { style  in
            if case let .cornerRadius(radius) = style {
                return radius > 0 ? true : false
            } else {
                return false
            }
        }
        
        for style in styles {
            switch style {
            case let .cornerRadius(radius):
                self.base.layer.cornerRadius = radius
                if !hasShadow {
                    self.base.layer.masksToBounds = true
                }
                
            case let .border(width, color):
                if let color = color, width > 0 {
                    self.base.layer.borderColor = color.cgColor
                    self.base.layer.borderWidth = width
                }
                
            case let .localizableText(key):
                guard let key = key else { continue }

                if let label = self.base as? UILabel {
                    label.text = key.ib.localized
                } else if let button = self.base as? UIButton {
                    button.setTitle(key.ib.localized, for: .normal)
                } else if let textField = self.base as? UITextField {
                    textField.text = key.ib.localized
                }
                
            case let .localizablePlaceHolder(key, color):
                guard let key = key else { continue }
                guard let textField = self.base as? UITextField else { continue }
                
                if let color = color {
                    let attributes: [NSAttributedString.Key: Any] = [
                        .foregroundColor: color
                    ]
                    textField.attributedPlaceholder = NSAttributedString(string: key.ib.localized, attributes: attributes)
                } else {
                    textField.placeholder = key.ib.localized
                }
                
            case let .shadow(offset, radius, color):
                guard let color = color else { continue }
                
                self.base.layer.shadowOpacity = 1
                self.base.layer.shadowColor = color.cgColor
                self.base.layer.shadowRadius = radius
                self.base.layer.shadowOffset = offset
                
                if hasCornerRadius {
                    self.base.layer.masksToBounds = false
                }
                
            case let .accessibilityIdentifier(identifier):
                if let identifier = identifier {
                    self.base.accessibilityIdentifier = identifier
                } else {
                    self.base.accessibilityIdentifier = String(describing: self.base.self)
                }
            }
        }
    }
}
