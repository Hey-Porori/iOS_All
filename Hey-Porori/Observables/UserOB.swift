//
//  UserOB.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/16.
//

import Foundation

class UserData: ObservableObject {
    @Published var accessToken: String = ""
    @Published var address: String = ""
    @Published var email: String = ""
    @Published var gender: Bool = false
    @Published var imageUrl: String = ""
    @Published var name: String = ""
    @Published var nickName: String = ""
    @Published var phoneNumber: String = ""
}
