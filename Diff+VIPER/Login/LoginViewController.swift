//
//  LoginViewController.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
    
    var presenter: LoginPresenterProtocol?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupPresenter()
    }
    
    private func setupPresenter() {
        let view = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.viewController = view
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        presenter?.login(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
        presenter?.forgetPassword()
    }
    
    func showLoading() {
        // Show loading indicator
    }
    
    func hideLoading() {
        // Hide loading indicator
    }
    
    func showError(_ error: Error) {
        // Show error message to user
    }
    
}

