//
//  SearchPlayerViewProtocol.swift
//  Dota2
//
//  Created by José Alves da Cunha on 01/08/23.
//

import UIKit

protocol SearchPlayerViewProtocol where Self: UIView {
    var didTapSearch: ((String) -> Void)? { get set }
}
