//
//  ListPlayerViewController.swift
//  Dota2
//
//  Created by José Alves da Cunha on 14/01/22.
//

import UIKit
import Foundation


final class ListPlayerViewController: UIViewController {
    var player: String?
    private let contentView: ListPlayerViewProtocol
    private let viewModel: PlayerViewModelProtocol
    
    init(contentView: ListPlayerViewProtocol = ListPlayerView(),
         viewModel: PlayerViewModelProtocol) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        bindActions()
        bindProperties()
        guard let player = player else { return }
        viewModel.getPlayerName(namePlayer: player)
    }
    
    private func bindActions() {
        contentView.didTapItem = { [weak self] idPlayer in
            self?.viewModel.selectedPlayer(idPlayer: idPlayer)
        }
    }
    
    private func bindProperties() {
        viewModel.items.bind { [weak self] items in
            self?.contentView.setup(with: items)
        }
        viewModel.screenState.bind { [weak self] state in
            switch state {
            case .error(let error):
                self?.contentView.error(isError: error)
            }
        }
    }
    
}

