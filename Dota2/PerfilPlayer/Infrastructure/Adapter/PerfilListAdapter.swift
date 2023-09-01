//
//  PerfilListAdapter.swift
//  Dota2
//
//  Created by José Alves da Cunha on 21/08/23.
//

import UIKit

protocol PerfilListAdapterProtocol {
    func perfilPlayer(with data: PerfilPlayer) -> PerfilCategory
    func winratePlayer(with data: Matches) -> PerfilCategory
    func recentMatches(with data: [RecentMatches]) -> PerfilCategory
    
}

final class PerfilListAdapter {
    
    private let ranking: [Int: String] = [
        11: "herald1",
        12: "herald2",
        13: "herald3",
        14: "herald4",
        15: "herald5",
        21: "guardian1",
        22: "guardian2",
        23: "guardian3",
        24: "guardian4",
        25: "guardian5",
        31: "cruzader1",
        32: "cruzader2",
        33: "cruzader3",
        34: "cruzader4",
        35: "cruzader5",
        41: "archon1",
        42: "archon2",
        43: "archon3",
        44: "archon4",
        45: "archon5",
        51: "legend1",
        52: "legend2",
        53: "legend3",
        54: "legend5",
        61: "ancient1",
        62: "ancient2",
        63: "ancient3",
        64: "ancient4",
        65: "ancient5",
        71: "divine1",
        72: "divine2",
        73: "divine3",
        74: "divine4",
        75: "divine5",
        80: "immortal"
    ]
    
    private func getWinrate(win: Int?, lose: Int?) -> String {
        guard let win = win else { return String() }
        guard let lose = lose else { return String() }
        let winrate = (Double(win) / Double(win + lose)) * 100
        return String(format: "%.2f%%", winrate)
        
    }
    
    private func getMedalPlayer(rankTier: Int?) -> UIImage? {
        guard let rank = rankTier, let image = ranking[rank] else { return nil }
        if rank != 0 {
            return UIImage(named: image)
        } else {
            return UIImage(named: "noRank")
        }
        
    }
    
    private func getHero(heroId: Int?) -> UIImage? {
        guard let id = heroId else { return nil }
        return UIImage(named: "hero\(id)")
    }
    
    private func getImage(url: URL, completion: @escaping (UIImage?) -> ())  {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}

extension PerfilListAdapter: PerfilListAdapterProtocol {
    func perfilPlayer(with data: PerfilPlayer) -> PerfilCategory {
        let name = data.profile.personaname
        let avatar = data.profile.avatarfull
        let rankTier = data.rankTier
        let rankImage = getMedalPlayer(rankTier: rankTier)
        let data = PlayerData(namePlayer: name, avatarPlayer: avatar, medalPlayer: rankImage)
        
        return PerfilCategory(cellTypes: [.perfilplayer(data)], priority: .perfilplayer)
    }
    
    func winratePlayer(with data: Matches) -> PerfilCategory {
        let win = "\(Strings.victory): \(data.win)"
        let lose = "\(Strings.defeats): \(data.lose)"
        let winrate = getWinrate(win: data.win, lose: data.lose)
        let data = MatchesData(win: win, lose: lose, rate: winrate)
        return PerfilCategory(cellTypes: [.winrate(data)], priority: .winrate)
    }
    
    func recentMatches(with data: [RecentMatches]) -> PerfilCategory {
        var matchDataList: [PerfilCellType] = []
        for match in data {
            let hero = match.heroId
            let heroAvatar = getHero(heroId: hero)
            let score = "\(match.kills)/\(match.deaths)/\(match.assists)"
            let result = UIImage(named: "victory")
            
            let matchData = RecentMatchesData(avartarHero: heroAvatar, score: score, resultMatch: result)
            matchDataList.append(.recentMatches(matchData))
        }
        return PerfilCategory(cellTypes: matchDataList, priority: .recentMatches)
    }
}
