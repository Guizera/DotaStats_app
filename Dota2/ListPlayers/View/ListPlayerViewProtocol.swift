//
//  ListPlayerViewProtocol.swift
//  Dota2
//
//  Created by José Alves da Cunha on 15/08/23.
//

import Foundation
import UIKit

protocol ListPlayerViewProtocol where Self: UIView {
    var didTapItem: ((Int) -> Void)? { get set }
    func setup(with items: [Players])
    func error(isError: Bool)
    
}

protocol PlayerTableViewCellProtocol where Self: UITableViewCell {
    func configure(with data: Players)
}
