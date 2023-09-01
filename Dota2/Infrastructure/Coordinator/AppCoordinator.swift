//
//  AppCoordinator.swift
//  Dota2
//
//  Created by José Alves da Cunha on 02/08/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var child: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}

public final class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var child: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let contentView: SearchPlayerViewProtocol = SearchView()
        let service = Webservices()
        let viewModel: SerachPlayerViewModelProtocol = SearchPlayerViewModel(service: service)
        let searchViewController = SearchPlayerViewController(contentView: contentView,
                                                              viewModel: viewModel,
                                                              coordinator: self)
        navigationController.pushViewController(searchViewController, animated: true)
        
    }
    
    func makeListPlayers(playerName: String) {
        let contentView: ListPlayerViewProtocol = ListPlayerView()
        let service = Webservices()
        let viewModel: PlayerViewModelProtocol = PlayerViewModel(service: service, coordinator: self)
        let listPlayerVC = ListPlayerViewController(contentView: contentView, viewModel: viewModel)
        listPlayerVC.player = playerName
        self.navigationController.pushViewController(listPlayerVC, animated: true)
    }
    
    func makePerfilPlayer(idPlayer: Int) {
        let contentView: PerfilViewProtocol = PerfilView()
        let service = Webservices()
        let adapter = PerfilListAdapter()
        let viewModel: PerfilPlayerViewModelProtocol = PerfilPlayerViewModel(services: service, adapter: adapter)
        let perfilViewController = PerfilPlayerViewController(contentView: contentView, viewModel: viewModel)
        perfilViewController.accountId = idPlayer
        self.navigationController.pushViewController(perfilViewController, animated: true)
    }
}

