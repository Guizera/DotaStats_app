//
//  UIImageView.swift
//  Dota2
//
//  Created by José Alves da Cunha on 27/09/21.
//

import UIKit

extension UIImageView {
    
    static func logoImage(named: String? = nil) -> UIImageView {
        
        let imageView = UIImageView()
        if let named = named {
            imageView.image = UIImage(named: named)
        }
        imageView.contentMode = .scaleAspectFit
        imageView.size(size: .init(width: 150, height: 150))
        imageView.clipsToBounds = true
        
        return imageView
    }
    static func imagePlayer(named: String? = nil) -> UIImageView {
        
        let imageView = UIImageView()
        if let named = named {
            imageView.image = UIImage(named: named)
        }
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.size(size: .init(width: 100, height: 100))
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor(named: Strings.ColorSet.colorClearGrey)?.cgColor
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        
        return imageView
    }
    static func medalImages(named: String? = nil) -> UIImageView {
        
        let imageview = UIImageView()
        if let named = named {
            imageview.image = UIImage(named: named)
        }
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.size(size: .init(width: 100, height: 100))
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        
        return imageview
    }
    
    static func imageMatch(named: String? = nil) -> UIImageView {
        
        let imageView = UIImageView()
        if let named = named {
            imageView.image = UIImage(named: named)
        }
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.size(size: .init(width: 30, height: 30))
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        
        return imageView
    }
    
    static func imageHero(named: String? = nil) -> UIImageView {
        
        let imageView = UIImageView()
        if let named = named {
            imageView.image = UIImage(named: named)
        }
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.size(size: .init(width: 50, height: 50))
        
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    static func imageError(named: String? = nil) -> UIImageView {
        
        let imageView = UIImageView()
        if let named = named {
            imageView.image = UIImage(named: named)
        }
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.size(size: .init(width: 200, height: 200))
        
        imageView.clipsToBounds = true
        
        return imageView
    }
}
