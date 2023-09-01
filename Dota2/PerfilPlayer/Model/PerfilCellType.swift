//
//  PerfilCellType.swift
//  Dota2
//
//  Created by José Alves da Cunha on 20/08/23.
//

import Foundation

enum PerfilCellType {
    case perfilplayer(PlayerData)
    case winrate(MatchesData)
    case recentMatches(RecentMatchesData)
    
    var identifier: String {
        switch self {
        case .perfilplayer:
            return PlayerViewCell.identifier
        case .winrate:
            return MatchesViewCell.identifier
        case .recentMatches:
            return RecentMatchesViewCell.identifier
        }
    }
}

enum PerfilCellPriority: Int {
    case perfilplayer = 0
    case winrate = 1
    case recentMatches = 2
}
