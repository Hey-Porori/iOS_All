//
//  TradeMainView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/16.
//

import SwiftUI

struct TradeMainView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    // TODO: 채팅 화면 네비게이션
                } label: {
                    Image(systemName: "bubble.left.and.bubble.right")
                        .font(Font(.size22))
                        .foregroundColor(.black)
                }

            }
        }
    }
}
