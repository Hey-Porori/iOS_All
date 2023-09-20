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

struct UserAdditionalInfoBody: Encodable {
    var accessToken: String
    var address: String
    var email: String
    var gender: Bool
    var imageUrl: String
    var name: String
    var nickName: String
    var phoneNumber: String
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
    
    func signInWithApple(token: String, userData: UserData) {
        let signInWithAppleUrl = userUrl + "/api/users/auth/apple"
        let param = IdTokenBody(token: token)
        let header: HTTPHeaders = ["Content-Type": "application/json", "Accept": "application/json"]
        
        AF.request(signInWithAppleUrl, method: .post, parameters: param, encoder: JSONParameterEncoder.default, headers: header)
            .responseDecodable(of: SignInWithAppleResponse.self) { response in
                switch response.result {
                case .success(let value):
                    print("Success to sign in with apple")
                    UserAPIManager.shared.dummyRegister(token: value.data.accessToken, userData: userData)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func dummyRegister(token: String, userData: UserData) {
        let dummyResisterUrl = userUrl + "/api/users/additional-info"
        
        let param = UserAdditionalInfoBody(accessToken: token, address: "서대문구 세무서길 141-12", email: "jm10123@gmail.com", gender: false, imageUrl: "1231", name: "김민수", nickName: "민수민수", phoneNumber: "010-1234-5678")
        let header: HTTPHeaders = ["Content-Type": "application/json", "Accept": "application/json"]
        
        AF.request(dummyResisterUrl, method: .put, parameters: param, encoder: JSONParameterEncoder.default, headers: header)
            .responseDecodable(of: SignInWithAppleResponse.self) { response in
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                
                switch response.result {
                case .success(let value):
                    print(value)
                    
                    // MARK: userData에 Register 후 데이터 삽입
                    DispatchQueue.main.async {
                        userData.accessToken = param.accessToken
                        userData.address = param.address
                        userData.email = param.email
                        userData.gender = param.gender
                        userData.imageUrl = param.imageUrl
                        userData.name = param.name
                        userData.nickName = param.nickName
                        userData.phoneNumber = param.phoneNumber
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
}
