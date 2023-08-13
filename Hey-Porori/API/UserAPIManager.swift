//
//  UserAPIManager.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/08/12.
//

import Foundation
import Alamofire

struct IdTokenBody: Encodable {
    var token: String
}

struct SignInWithAppleResponse: Decodable {
    let data: SignInData
    let message: String
    let statusCode: Int
    
    struct SignInData: Decodable {
        let accessToken: String
        let refreshToken: String
        let registrationStatus: Bool
    }
}

final class UserAPIManager {
    static let shared = UserAPIManager()
    private init() {}
    
    private let userUrl = Bundle.main.userAPIUrl
    
    func signInWithApple(token: String) {
        let signInWithAppleUrl = userUrl + "/api/users/auth/apple"
        let param = IdTokenBody(token: token)
        let header: HTTPHeaders = ["Content-Type": "application/json", "Accept": "application/json"]
        
        AF.request(signInWithAppleUrl, method: .post, parameters: param, encoder: JSONParameterEncoder.default, headers: header)
//            .responseDecodable(of: SignInWithAppleResponse.self) { response in
//                print("Request: \(String(describing: response.request))")
//                print("Response: \(String(describing: response.response))")
//                print("Result: \(response.result)")
//
//                switch response.result {
//                case .success(let value):
//                    print(value)
//                case .failure(let error):
//                    print(error)
//                }
//            }
            .responseData { response in
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                switch response.result {
                case .success(let value):
                    if let jsonString = String(data: value, encoding: .utf8) {
                        print(jsonString)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
