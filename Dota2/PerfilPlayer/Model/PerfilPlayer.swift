//
//  PerfilPlayer.swift
//  Dota2
//
//  Created by José Alves da Cunha on 27/01/22.
//

import Foundation

//MARK: - PerfilPlayer

public struct PerfilPlayer: Decodable {
    let rankTier: Int?
    let leaderboardRank: Int?
    let profile: Profile
    
    private enum CodingKeys: String, CodingKey {
        case rankTier = "rank_tier"
        case leaderboardRank = "leaderboard_rank"
        case profile
    }
}
public struct Profile: Decodable {
    let accountId: Int
    let personaname: String?
    let name: String?
    let plus: Bool
    let avatarfull: URL
    
    private enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case personaname
        case name
        case plus
        case avatarfull
    }
}

//MARK: - Matches

public struct Matches: Decodable {
    let win: Int
    let lose: Int
}

//MARK: - RecentMatches

public struct RecentMatches: Decodable {
    let matchId: Int
    let radiantWin: Bool
    let duration: Int
    let gameMode: Int
    let heroId: Int
    let kills: Int
    let deaths: Int
    let assists: Int
    let skill: Int?
    
    private enum CodingKeys: String, CodingKey {
        case matchId = "match_id"
        case radiantWin = "radiant_win"
        case duration
        case gameMode = "game_mode"
        case heroId = "hero_id"
        case kills
        case deaths
        case assists
        case skill
    }
}
