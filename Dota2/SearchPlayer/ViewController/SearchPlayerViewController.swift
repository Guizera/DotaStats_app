//
//  SearchPlayerViewController.swift
//  Dota2
//
//  Created by José Alves da Cunha on 22/05/21.
//

import UIKit

final class SearchPlayerViewController: UIViewController {
    private let contentView: SearchPlayerViewProtocol
    private let viewModel: SerachPlayerViewModelProtocol
    private weak var coordinator: AppCoordinator?
    
    init(contentView: SearchPlayerViewProtocol = SearchView(),
         viewModel: SerachPlayerViewModelProtocol,
         coordinator: AppCoordinator?) {
        self.contentView = contentView
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindActions()
    }
    
    private func bindActions() {
        contentView.didTapSearch = { [weak self] player in
            self?.coordinator?.makeListPlayers(playerName: player)
        }
    }
}
