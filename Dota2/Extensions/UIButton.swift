//
//  UIButton.swift
//  Dota2
//
//  Created by José Alves da Cunha on 27/09/21.
//

import UIKit

extension UIButton {
    
    static func searchButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.size(size: .init(width: 312, height: 62))
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(named: Strings.ColorSet.colorWhite), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.backgroundColor = color
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        
        
        return button
        
    }
    
    
    
}
