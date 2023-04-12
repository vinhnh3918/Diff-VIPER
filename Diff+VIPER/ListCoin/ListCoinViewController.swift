//
//  ListCoinViewController.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import UIKit
import Foundation

class ListCoinViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: ListCoinPresenter!
    var coins: [Coin] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupPresenter()
        presenter.fetchCoins(limit: 15)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupPresenter() {
        let api = ListCoinAPI()
        let interactor = ListCoinInteractor(api: api)
        presenter = ListCoinPresenter(interactor: interactor)
        presenter.attachView(self)
    }
    
    deinit {
        presenter?.detachView()
    }
}

extension ListCoinViewController: ListCoinViewProtocol {
    func showCoins(_ coins: [Coin]) {
        self.coins = coins
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

extension ListCoinViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(coins[indexPath.row].rank). \(coins[indexPath.row].name)"
        return cell
    }
}
