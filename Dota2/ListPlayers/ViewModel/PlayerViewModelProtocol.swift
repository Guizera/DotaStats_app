//
//  PlayerViewModelProtocol.swift
//  Dota2
//
//  Created by José Alves da Cunha on 15/08/23.
//

import Foundation

enum ListViewState {
    case error(Bool)
}


protocol PlayerViewModelProtocol {
    var screenState: Bindable<ListViewState> { get set }
    var items: Bindable<[Players]> { get set }
    func getPlayerName(namePlayer: String)
    func selectedPlayer(idPlayer: Int)
}

