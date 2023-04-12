//
//  ListCoinAPI.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import Foundation
import Alamofire

struct CoinCapResponse: Codable {
    let data: [Coin]
}

class ListCoinAPI: ListCoinAPIProtocol {
    func fetchCoins(limit: Int, completion: @escaping (Result<[Coin], Error>) -> Void) {
        let url = "https://api.coincap.io/v2/assets?limit=\(limit)"
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let coinsResponse = try decoder.decode(CoinCapResponse.self, from: jsonData)
                    completion(.success(coinsResponse.data))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
