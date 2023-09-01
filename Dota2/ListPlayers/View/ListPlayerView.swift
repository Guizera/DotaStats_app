//
//  ListPlayerView.swift
//  Dota2
//
//  Created by José Alves da Cunha on 15/08/23.
//

import Foundation
import UIKit

final class ListPlayerView: UIView {
    private var dataSource: ListPlayerDataSource?
    var didTapItem: ((Int) -> Void)?
    private let errorview = ErrorView()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: Strings.cellIdentifier)
        tableView.backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    private let headerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.players
        label.textColor = UIColor(named: Strings.ColorSet.colorClearGrey)
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: Strings.ColorSet.colorBackground)
        buildHierarchy()
        buildContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHierarchy() {
        addSubview(headerView)
        headerView.addSubview(headerLabel)
        addSubview(tableView)
        addSubview(errorview)
        bringSubviewToFront(errorview)
    }
    
    private func buildContraints() {
        errorview.fillSuperView()
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            headerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            headerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
extension ListPlayerView: ListPlayerViewProtocol {
    func error(isError: Bool) {
        errorview.isHidden = !isError
    }
    
    func setup(with items: [Players]) {
        dataSource = ListPlayerDataSource(items: items)
        dataSource?.didTapItem = didTapItem
        DispatchQueue.main.async {
            self.tableView.delegate = self.dataSource
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
        
    }
}
