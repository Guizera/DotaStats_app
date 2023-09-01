//
//  PerfilPlayerViewModelProtocol.swift
//  Dota2
//
//  Created by José Alves da Cunha on 20/08/23.
//

import Foundation

enum PerfilViewState {
    case loading(Bool)
    case refreshList([PerfilCategory])
}

protocol PerfilPlayerViewModelProtocol {
    var screenState: Bindable<PerfilViewState> { get set }
    func reloadList(accountId: Int)
}
