//
//  LoginInteractor.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import Foundation

protocol LoginInteractorProtocol: AnyObject {
    func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func forgetPassword(completion: @escaping (Result<Void, Error>) -> Void)
}

class LoginInteractor: LoginInteractorProtocol {
    
    var authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
    }
    
    func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        authService.login(username: username, password: password) { result in
            switch result {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func forgetPassword(completion: @escaping (Result<Void, Error>) -> Void) {
        authService.forgetPassword { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
