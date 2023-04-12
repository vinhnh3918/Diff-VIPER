//
//  LoginPresenter.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    var router: LoginRouterProtocol? { get set }
    
    func viewDidLoad()
    func login(username: String, password: String)
    func forgetPassword()
}

class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
    func viewDidLoad() {
        // Do any setup needed for the view
    }
    
    func login(username: String, password: String) {
        view?.showLoading()
        interactor?.login(username: username, password: password) { [weak self] result in
            self?.view?.hideLoading()
            if (!username.isEmpty && !password.isEmpty) {
                self?.router?.showHomeScreen(for: User.init(id: 1, name: username))
            }
//            switch result {
//            case .success(let user):
//                self?.router?.showHomeScreen(for: user)
//            case .failure(let error):
//                self?.view?.showError(error)
//            }
        }
    }
    
    func forgetPassword() {
        view?.showLoading()
        interactor?.forgetPassword { [weak self] result in
            self?.view?.hideLoading()
            switch result {
            case .success:
                self?.router?.showForgetPasswordScreen()
            case .failure(let error):
                self?.view?.showError(error)
            }
        }
    }
    
}
