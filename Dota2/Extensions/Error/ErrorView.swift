//
//  ErrorView.swift
//  Dota2
//
//  Created by Guilherme Cunha on 29/08/23.
//

import Foundation
import UIKit

final class ErrorView: UIView {
    
    private let errorImage: UIImageView = {
        .imageError(named: Strings.errorImage)
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.errorMessage
        label.textColor = UIColor(named: Strings.ColorSet.colorClearGrey)
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
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
        stackView.addArrangedSubview(errorImage)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    private func buildContraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
