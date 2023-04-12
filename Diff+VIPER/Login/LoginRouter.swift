//
//  LoginRouter.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import Foundation
import UIKit

protocol LoginRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    func showHomeScreen(for user: User)
    func showForgetPasswordScreen()
}

class LoginRouter: LoginRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func showHomeScreen(for user: User) {
        DispatchQueue.main.async {
            guard let navigationController = self.viewController?.navigationController else { return }
            let homeViewController = ListCoinViewController()
            navigationController.pushViewController(homeViewController, animated: true)
        }
    }
    
    func showForgetPasswordScreen() {
        // Show forget password screen
    }
    
}
