//
//  PerfilPlayerViewModel.swift
//  Dota2
//
//  Created by José Alves da Cunha on 30/01/22.
//

import Foundation


final class PerfilPlayerViewModel {
   
    private let services: Webservices
    let adapter: PerfilListAdapterProtocol
    var screenState: Bindable<PerfilViewState> = Bindable(.loading(false))
    
    private var cellsCategory: [PerfilCategory] = [] {
        didSet {
            refreshAllCells()
        }
    }
    
    init(services: Webservices,
         adapter: PerfilListAdapterProtocol) {
        self.services = services
        self.adapter = adapter
    }
}

extension PerfilPlayerViewModel {
    //MARK: - Requests
    func requestPerfilPlayer(accountId: Int) {
        self.screenState.value = .loading(true)
        guard let url = URL(string: "https://api.opendota.com/api/players/\(accountId)") else { return }
        services.getPerfilPlayer(url: url) { response in
            self.screenState.value = .loading(false)
            switch response {
            case .success(let result):
                guard let perfil = result else { return }
                self.successPerfilPlayer(perfil: perfil)
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
    
    func requestWinRatePlayer(accountId: Int) {
        guard let url = URL(string: "https://api.opendota.com/api/players/\(accountId)/wl") else { return }
        services.getMatches(url: url) { response in
            switch response {
            case .success(let result):
                guard let matches = result else { return }
                self.successMatches(matches: matches)
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
    
    func requestRecentMatches(accountId: Int) {
        guard let url = URL(string: "https://api.opendota.com/api/players/\(accountId)/recentMatches") else { return }
        services.getRecentMatches(url: url) { response in
            switch response {
            case .success(let result):
                guard let result = result else { return }
                self.successRecentMathces(recentMatches: result)
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
    
    //MARK: - Success handler
    private func successPerfilPlayer(perfil: PerfilPlayer) {
        let perfil = adapter.perfilPlayer(with: perfil)
        cellsCategory.append(perfil)
        
    }
    
    private func successMatches(matches: Matches) {
        let matches = adapter.winratePlayer(with: matches)
        cellsCategory.append(matches)
    }
    
    private func successRecentMathces(recentMatches: [RecentMatches]) {
        let recentMatches = adapter.recentMatches(with: recentMatches)
        cellsCategory.append(recentMatches)
    }
    
    //MARK: - Other Functions
    private func refreshAllCells() {
        let sortedCells = cellsCategory.sorted(by: ({ $0.priority.rawValue < $1.priority.rawValue }))
        screenState.value = .refreshList(sortedCells)
    }
}

extension PerfilPlayerViewModel: PerfilPlayerViewModelProtocol {
    func reloadList(accountId: Int) {
        requestPerfilPlayer(accountId: accountId)
        requestWinRatePlayer(accountId: accountId)
        requestRecentMatches(accountId: accountId)
    }
}
