//
//  LoginView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/08/07.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    var body: some View {
        VStack {
            appleLoginButton.padding(.horizontal, 50).frame(height: 80)
        }
    }
    
    // MARK: 애플 로그인 버튼
    var appleLoginButton: some View {
        SignInWithAppleButton { request in
            request.requestedScopes = [.fullName, .email]
        } onCompletion: { result in
            switch result {
            case .success(let authResults):
                print("Apple Login Successful")
                switch authResults.credential {
                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                       // 계정 정보 가져오기
                        let userIdentifier = appleIDCredential.user
                        let fullName = appleIDCredential.fullName
                        let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                        let email = appleIDCredential.email
                        let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                        let authorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                    print("identityToken :: \(identityToken!)")
                default:
                    break
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("error")
            }
        }
    }
}
