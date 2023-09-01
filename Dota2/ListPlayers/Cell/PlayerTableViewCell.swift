//
//  PlayerTableViewCell.swift
//  Dota2
//
//  Created by José Alves da Cunha on 14/01/22.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: Strings.ColorSet.colorGrey)
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = false
        return view
    }()
    
    private let playerName: UILabel = {
        .textBoldLabel(24.0)
    }()
    
    private let avatarPlayer: UIImageView = {
        .imagePlayer()
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        buildHierarchy()
        buildConstraints()
        
}
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension PlayerTableViewCell {
    
    private func buildHierarchy() {
        contentView.addSubview(bgView)
        bgView.addSubview(stackView)
        stackView.addArrangedSubview(avatarPlayer)
        stackView.addArrangedSubview(playerName)
        
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
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
extension PlayerTableViewCell: PlayerTableViewCellProtocol {
    func configure(with data: Players) {
        playerName.text = data.personaname
        let url = data.avatarfull
        
        URLSession.shared.dataTask(with: url) { data, reponse, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.avatarPlayer.image = image
                }
            } else {
                self.avatarPlayer.image = UIImage(named: Strings.playerImage)
            }
        }.resume()
    }
}
