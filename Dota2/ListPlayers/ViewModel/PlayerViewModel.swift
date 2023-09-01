//
//  PlayerViewModel.swift
//  Dota2
//
//  Created by José Alves da Cunha on 21/01/22.
//

import Foundation
import UIKit

final class PlayerViewModel {
    var items: Bindable<[Players]> = Bindable([])
    var screenState: Bindable<ListViewState> = Bindable(.error(false))
    
    private let service: Webservices
    private let coordinator: AppCoordinator?
    
    init(service: Webservices, coordinator: AppCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
}

extension PlayerViewModel: PlayerViewModelProtocol {
    func getPlayerName(namePlayer: String) {
       guard let url = URL(string: "https://api.opendota.com/api/search?q=\(namePlayer)") else { return }
       service.getPlayerByName(url: url) { response in
           switch response {
           case .success(let players):
               guard let players = players else { return }
               self.items.value = players
               self.screenState.value = .error(false)
               print(namePlayer)
           case .failure(let error):
               self.screenState.value = .error(true)
               print(error)
           }
       }
   }
    func selectedPlayer(idPlayer: Int) {
        self.coordinator?.makePerfilPlayer(idPlayer: idPlayer)
    }
}
