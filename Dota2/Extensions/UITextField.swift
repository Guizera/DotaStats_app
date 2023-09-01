//
//  UITextField.swift
//  Dota2
//
//  Created by José Alves da Cunha on 27/09/21.
//

import UIKit

extension UITextField {
    
    static func searchTextField() -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.attributedPlaceholder = NSAttributedString(string: Strings.placeHolderSearchPlayer, attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: Strings.ColorSet.colorClearGrey) ?? .white])
        textField.backgroundColor = UIColor(named: Strings.ColorSet.colorGrey)
        textField.layer.borderColor = UIColor(named: Strings.ColorSet.colorGrey)?.cgColor
        textField.textColor = UIColor(named: Strings.ColorSet.colorWhite)
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 8
        textField.returnKeyType = .go
        
        textField.leftView = UIView(frame: CGRect(x: 0,y: 0,width: 25,height: 0))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        textField.rightViewMode = UITextField.ViewMode.always        
        
        return textField
        
    }
    
    
    
}
