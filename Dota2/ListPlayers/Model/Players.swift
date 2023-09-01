//
//  Players.swift
//  Dota2
//
//  Created by José Alves da Cunha on 11/01/22.
//

import Foundation
    
struct Players: Decodable {
    let account_id: Int
    let personaname: String
    let avatarfull: URL
}
