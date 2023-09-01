//
//  PlayerDataSource.swift
//  Dota2
//
//  Created by José Alves da Cunha on 20/08/23.
//

import Foundation
import UIKit

struct PerfilCategory {
    var cellTypes: [PerfilCellType]
    var priority: PerfilCellPriority
}

final class PlayerDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    private let items: [PerfilCategory]
    
    init(items: [PerfilCategory]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items[section].cellTypes.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTypes = items[indexPath.section].cellTypes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTypes.identifier, for: indexPath)
        setupTableViewCell(cell, for: cellTypes)
        return cell
    }
    
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
      }
    
    private func setupTableViewCell(_ cell: UITableViewCell?, for cellType: PerfilCellType) {
        if case .perfilplayer(let playerData) = cellType,
           let perfilCell = cell as? any PlayerCellProtocol {
            perfilCell.configure(with: playerData)
        } else if case .winrate(let matchesData) = cellType,
                  let winrateCell = cell as? any MatchesCellProtocol {
            winrateCell.configure(with: matchesData)
        } else if case .recentMatches(let recentMatchesData) = cellType,
                  let recentMatchesCell = cell as? any RecentMatchesProtocol {
            recentMatchesCell.configure(with: recentMatchesData)
        }
    }
}
