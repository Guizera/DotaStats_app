//
//  SearchPlayerViewModel.swift
//  Dota2
//
//  Created by José Alves da Cunha on 14/08/23.
//

import Foundation

final class SearchPlayerViewModel {
    private let service: Webservices
    
    init(service: Webservices) {
        self.service = service
    }
}

extension SearchPlayerViewModel: SerachPlayerViewModelProtocol {
 
}
