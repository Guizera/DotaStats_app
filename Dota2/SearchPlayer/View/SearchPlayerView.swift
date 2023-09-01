//
//  SearchPlayerView.swift
//  Dota2
//
//  Created by José Alves da Cunha on 01/08/23.
//

import Foundation
import UIKit

final class SearchView: UIView, SearchPlayerViewProtocol {
    var didTapSearch: ((String) -> Void)?
    
    private let searchButton: UIButton = {
        .searchButton(title: Strings.searchBtnTitle,
                      color: UIColor(named: Strings.ColorSet.colorRed) ?? .red)
    }()
    
    private let logoDota: UIImageView = {
        .logoImage(named: Strings.logo)
    }()
    
    private let searchTextField: UITextField = {
        .searchTextField()
    }()
    
    private let searchStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        buildHierarchy()
        buildConstraints()
        buildAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHierarchy() {
        searchStack.addArrangedSubview(logoDota)
        searchStack.addArrangedSubview(searchTextField)
        searchStack.addArrangedSubview(searchButton)
        addSubview(searchStack)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            searchStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            searchStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            searchStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 130)
            
        ])
    }
    
    private func buildAction() {
        searchButton.addTarget(self, action: #selector(searchPlayer), for: .touchUpInside)
    }
    @objc
    private func searchPlayer() {
        guard let playerName = searchTextField.text else { return }
        didTapSearch?(playerName)
    }
}
