//
//  ListCoinAPIProtocol.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import Foundation

protocol ListCoinAPIProtocol {
    func fetchCoins(limit: Int, completion: @escaping (Result<[Coin], Error>) -> Void)
}
