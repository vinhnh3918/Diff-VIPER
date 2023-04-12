//
//  AuthService.swift
//  Diff+VIPER
//
//  Created by mac on 12/04/2023.
//

import Foundation

enum AuthError: Error {
    case networkError
    case invalidCredentials
    case invalidResponse
}

protocol AuthServiceProtocol {
    func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func forgetPassword(completion: @escaping (Result<Void, Error>) -> Void)
}

class AuthService: AuthServiceProtocol {
    
    func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        // Make API call to login endpoint
        let url = URL(string: "https://api.example.com/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let body = "username=\(username)&password=\(password)"
        request.httpBody = body.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(AuthError.networkError))
                return
            }
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(AuthError.invalidResponse))
            }
        }
        task.resume()
    }
    
    func forgetPassword(completion: @escaping (Result<Void, Error>) -> Void) {
        // Make API call to forget password endpoint
        // ...
    }
    
}
