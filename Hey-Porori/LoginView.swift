//
//  LoginView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/08/07.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @EnvironmentObject var userData: UserData
    
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
                    UserAPIManager.shared.signInWithApple(token: identityToken!, userData: userData)
                default:
                    break
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("error")
            }
        }.onAppear {
            let token = Bundle.main.testAccessToken
            let param = userAdditionalInfoBody(accessToken: token, address: "서대문구 세무서길 141-12", email: "jm10123@gmail.com", gender: false, imageUrl: "1231", name: "김민수", nickName: "민수민수", phoneNumber: "010-1234-5678")
            // TODO: 테스트용 데이터. 추후 삭제 요망.
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
        }
    }
}
