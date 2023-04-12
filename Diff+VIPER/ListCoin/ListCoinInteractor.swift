//
//  ListCoinInteractor.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import Foundation

class ListCoinInteractor {
    var api: ListCoinAPIProtocol
    
    init(api: ListCoinAPIProtocol) {
        self.api = api
    }
    
    func fetchCoins(limit: Int, completion: @escaping (Result<[Coin], Error>) -> Void) {
        api.fetchCoins(limit: limit, completion: completion)
    }
}
