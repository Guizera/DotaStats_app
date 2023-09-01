//
//  PerfilPlayerViewController.swift
//  Dota2
//
//  Created by José Alves da Cunha on 27/01/22.
//
import UIKit

final class PerfilPlayerViewController: UIViewController {
    var accountId: Int?
    
    private let contentView: PerfilViewProtocol
    private let viewModel: PerfilPlayerViewModelProtocol
    private var dataSource: PlayerDataSource?
    
    init(contentView: PerfilViewProtocol,
         viewModel: PerfilPlayerViewModelProtocol) {
        self.contentView = contentView
        self.viewModel = viewModel
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
        bindProperties()
        guard let accountId = accountId else { return }
        viewModel.reloadList(accountId: accountId)
        
    }
    
    private func bindProperties() {
        viewModel.screenState.bind { [weak self] state in
            switch state {
            case .loading(let loading):
                self?.contentView.loading(isLoading: loading)
            case .refreshList(let items):
                self?.contentView.setup(with: items)
            }
        }
    }
}

