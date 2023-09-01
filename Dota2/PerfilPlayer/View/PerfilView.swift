//
//  PerfilView.swift
//  Dota2
//
//  Created by José Alves da Cunha on 17/08/23.
//

import Foundation
import UIKit

final class PerfilView: UIView {
    private var dataSource: PlayerDataSource?
    private let loadingOverlay = LoadingOverlay()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 10, bottom: .zero, right: 10)
        tableView.register(PlayerViewCell.self, forCellReuseIdentifier: PlayerViewCell.identifier)
        tableView.register(MatchesViewCell.self, forCellReuseIdentifier: MatchesViewCell.identifier)
        tableView.register(RecentMatchesViewCell.self, forCellReuseIdentifier: RecentMatchesViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        buildHierarchy()
        buildConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHierarchy() {
        addSubview(tableView)
        addSubview(loadingOverlay)
        bringSubviewToFront(loadingOverlay)
    }
    
    private func buildConstraints() {
        loadingOverlay.fillSuperView()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
extension PerfilView: PerfilViewProtocol {
    func loading(isLoading: Bool) {
        loadingOverlay.isHidden = !isLoading
    }
    
    func error(isError: Bool) {
        
    }
    
    func setup(with items: [PerfilCategory]) {
        let dataSource = PlayerDataSource(items: items)
        self.dataSource = dataSource
        DispatchQueue.main.async {
            self.tableView.dataSource = dataSource
            self.tableView.delegate = dataSource
            self.tableView.reloadData()
        }
    }
}
