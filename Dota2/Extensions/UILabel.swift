//
//  UILabel.swift
//  Dota2
//
//  Created by José Alves da Cunha on 20/01/22.
//

import UIKit

extension UILabel {
    
    static func textBoldLabel(_ size: CGFloat, textColor: UIColor = .white, numberOfLines: Int = 1) -> UILabel {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.lineBreakMode = .byClipping
        return label
        
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = false
    }
    
    
}
