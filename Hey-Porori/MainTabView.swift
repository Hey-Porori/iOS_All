//
//  MainTabView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/15.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            JobMainView()
                .tabItem {
                    Label("알바", systemImage: "person")
                }
            CommunityMainView()
                .tabItem {
                    Label("커뮤니티", systemImage: "person")
                }
            CommunityMainView()
                .tabItem {
                    Label("사용자", systemImage: "person")
                }
        }
    }
}
