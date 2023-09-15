//
//  Hey_PororiApp.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/06/25.
//

import SwiftUI

@main
struct HeyPororiApp: App {
    @StateObject var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            if userData.accessToken.isEmpty {
                LoginView().environmentObject(userData)
            } else {
                MainTabView()
            }
        }
    }
}
