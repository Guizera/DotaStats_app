//
//  RecentMatchesViewCell.swift
//  Dota2
//
//  Created by José Alves da Cunha on 18/08/23.
//

import Foundation
import UIKit

final class RecentMatchesViewCell: UITableViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: Strings.ColorSet.colorGrey)
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let stackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private let heroImage: UIImageView = {
        .imageHero()
    }()
    
    private let scoreLabel: UILabel = {
        .textBoldLabel(24)
    }()
    
    private let resultMatchImage: UIImageView = {
        .imageMatch()
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
        stackView.addArrangedSubview(heroImage)
        stackView.addArrangedSubview(scoreLabel)
        stackView.addArrangedSubview(resultMatchImage)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            bgView.heightAnchor.constraint(equalToConstant: 80),
            
            stackView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -14),
            stackView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -8)
            
        ])
    }
}
extension RecentMatchesViewCell: RecentMatchesProtocol {
    func configure(with data: RecentMatchesData) {
        heroImage.image = data.avartarHero
        scoreLabel.text = data.score
        resultMatchImage.image = data.resultMatch
    }
}
