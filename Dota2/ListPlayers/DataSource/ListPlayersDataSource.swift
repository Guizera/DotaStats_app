//
//  ListPlayersDataSource.swift
//  Dota2
//
//  Created by José Alves da Cunha on 15/08/23.
//

import Foundation
import UIKit

final class ListPlayerDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let items: [Players]
    var didTapItem: ((Int) -> Void)?
    
    init(items: [Players]) {
        self.items = items
        super.init()
    }
    
    func tableView(_ : UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Strings.cellIdentifier, for: indexPath) as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        didTapItem?(item.account_id)
    }
    
}
