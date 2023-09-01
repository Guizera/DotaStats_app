//
//  PlayerViewCell.swift
//  Dota2
//
//  Created by José Alves da Cunha on 17/08/23.
//

import Foundation
import UIKit

final class PlayerViewCell: UITableViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        return view
    }()
    
    private let avatarPlayer: UIImageView = {
        .imagePlayer()
    }()
    
    private let namePlayer: UILabel = {
        .textBoldLabel(24)
    }()
    
    private let medalPlayer: UIImageView = {
        .medalImages()
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalSpacing
        stack.spacing = 8
        stack.axis = .horizontal
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        buildHierarchy()
        buildContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHierarchy() {
        contentView.addSubview(bgView)
        bgView.addSubview(stackView)
        stackView.addArrangedSubview(avatarPlayer)
        stackView.addArrangedSubview(namePlayer)
        stackView.addArrangedSubview(medalPlayer)
        
    }
    
    private func buildContraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: 10)
        ])
    }
}
extension PlayerViewCell: PlayerCellProtocol {
    func configure(with data: PlayerData) {
        namePlayer.text = data.namePlayer
        guard let urlAvatar = data.avatarPlayer else { return }
        URLSession.shared.dataTask(with: urlAvatar) { data, reponse, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.avatarPlayer.image = image
                }
            } else {
                self.avatarPlayer.image = UIImage(named: Strings.playerImage)
            }
        }.resume()
        medalPlayer.image = data.medalPlayer
    }
    
}
