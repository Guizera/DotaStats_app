//
//  File.swift
//  Dota2
//
//  Created by José Alves da Cunha on 24/08/23.
//

import UIKit

public class LoadingOverlay: UIView {
    
    private let logo: UIImageView = {
        .logoImage(named: Strings.logo)
    }()
    
    private let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()
    
    private let stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        buildHierarchy()
        buildContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(logo)
        stackView.addArrangedSubview(indicator)
    }
    
    private func buildContraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
