//
//  PerfilViewProtocol.swift
//  Dota2
//
//  Created by José Alves da Cunha on 20/08/23.
//

import Foundation
import UIKit

protocol PerfilViewProtocol where Self: UIView {
    func setup(with items: [PerfilCategory])
    func loading(isLoading: Bool)
    func error(isError: Bool)
}

//MARK: - PlayerlCellProtocol
protocol PlayerCellProtocol where Self: UITableViewCell {
    func configure(with data: PlayerData)
}

//MARK: - MatchesCellProtocol
protocol MatchesCellProtocol where Self: UITableViewCell {
    func configure(with data: MatchesData)
}

//MARK: - RecentMatchesProtocol
protocol RecentMatchesProtocol where Self: UITableViewCell {
    func configure(with data: RecentMatchesData)
}
