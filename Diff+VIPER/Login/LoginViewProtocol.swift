//
//  LoginViewProtocol.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import Foundation
protocol LoginViewProtocol: AnyObject {
    
    var presenter: LoginPresenterProtocol? { get set }
    
    func showLoading()
    func hideLoading()
    func showError(_ error: Error)
}
