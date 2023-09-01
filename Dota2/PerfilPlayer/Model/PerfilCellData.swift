//
//  PerfilCellData.swift
//  Dota2
//
//  Created by José Alves da Cunha on 21/08/23.
//

import UIKit

struct PlayerData {
    let namePlayer: String?
    let avatarPlayer: URL?
    let medalPlayer: UIImage?
}

struct MatchesData {
    let win: String?
    let lose: String?
    let rate: String?
}

struct RecentMatchesData{
    let avartarHero: UIImage?
    let score: String?
    let resultMatch: UIImage?
}
