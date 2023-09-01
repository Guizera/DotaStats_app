//
//  MatchesViewCell.swift
//  Dota2
//
//  Created by José Alves da Cunha on 18/08/23.
//

import Foundation
import UIKit

final class MatchesViewCell: UITableViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        return view
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalCentering
        stack.axis = .horizontal
        return stack
    }()
    
    private let winLabel: UILabel = {
        .textBoldLabel(16)
    }()
    
    private let loseLabel: UILabel = {
        .textBoldLabel(16)
    }()
    
    private let winrateLabel: UILabel = {
        .textBoldLabel(16)
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        buildHierarchy()
        buildConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHierarchy() {
        contentView.addSubview(bgView)
        bgView.addSubview(stackView)
        stackView.addArrangedSubview(winLabel)
        stackView.addArrangedSubview(loseLabel)
        stackView.addArrangedSubview(winrateLabel)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            stackView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -10)
        ])
    }
}

extension MatchesViewCell: MatchesCellProtocol {
    func configure(with data: MatchesData) {
        winLabel.text = data.win
        loseLabel.text = data.lose
        winrateLabel.text = data.rate
    }
}
