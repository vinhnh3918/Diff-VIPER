//
//  ListCoinPresenter.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import Foundation

protocol ListCoinViewProtocol: AnyObject {
    func showCoins(_ coins: [Coin])
    func showError(_ error: Error)
}

class ListCoinPresenter {
    var interactor: ListCoinInteractor
    weak var view: ListCoinViewProtocol?
    
    init(interactor: ListCoinInteractor) {
        self.interactor = interactor
    }
    
    func attachView(_ view: ListCoinViewProtocol) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func fetchCoins(limit: Int) {
        interactor.fetchCoins(limit: limit) { [weak self] result in
            switch result {
            case .success(let coins):
                self?.view?.showCoins(coins)
            case .failure(let error):
                self?.view?.showError(error)
            }
        }
    }
}
