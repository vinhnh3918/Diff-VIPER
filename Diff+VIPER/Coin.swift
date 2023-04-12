//
//  Coin.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import Foundation

struct Coin: Codable {
    let id: String
    let rank: String
    let symbol: String
    let name: String
    let supply: String
    let maxSupply: String?
    let marketCapUsd: String?
    let volumeUsd24Hr: String?
    let priceUsd: String?
    let changePercent24Hr: String?
    let vwap24Hr: String?
}
