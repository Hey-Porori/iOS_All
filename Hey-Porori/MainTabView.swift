//
//  MainTabView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/15.
//

import SwiftUI

struct MainTabView: View {
    init() {
        // 탭바 투명해지지 않도록
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .white
    }
    var body: some View {
        NavigationStack {
            TabView {
                TradeMainView()
                    .tabItem {
                        Label("알바", systemImage: "latch.2.case.fill")
                    }
                CommunityMainView()
                    .tabItem {
                        Label("커뮤니티", systemImage: "person.3.fill")
                    }
                TradeMainView()
                    .tabItem {
                        Label("중고거래", systemImage: "arrow.2.squarepath")
                    }
            }
        }
    }
}
