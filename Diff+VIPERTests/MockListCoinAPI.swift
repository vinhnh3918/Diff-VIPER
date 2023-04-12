//
//  MockListCoinAPI.swift
//  Diff+VIPERTests
//
//  Created by mac on 12/04/2023.
//

import Foundation
@testable import Diff_VIPER

class MockListCoinAPI: ListCoinAPIProtocol {
    var coins: [Coin]?
    var error: Error?
    
    func fetchCoins(limit: Int, completion: @escaping (Result<[Coin], Error>) -> Void) {
        if let coins = coins {
            completion(.success(coins))
        } else if let error = error {
            completion(.failure(error))
        }
    }
}
