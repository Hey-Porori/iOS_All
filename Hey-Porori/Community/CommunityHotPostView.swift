//
//  CommunityHotPostView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/16.
//

import SwiftUI

struct CommunityHotPostView: View {
    var body: some View {
        ScrollView {
            VStack {
                communityPostRow()
                communityPostRow()
                communityPostRow()
                communityPostRow()
                communityPostRow()
                communityPostRow()
                communityPostRow()
                communityPostRow()
                communityPostRow()
                Spacer()
            }
        }
    }
}

func communityPostRow() -> some View {
    return HStack {
        Image("dummyImage")
            .resizable()
            .frame(width: 75, height: 75)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        VStack(alignment: .leading) {
            Text("Lorem ipsum dolor amet consectetur.")
                .font(.system(size: 16, weight: .bold))
                .lineLimit(1)
            Spacer().frame(height: 3)
            Text("Lorem ipsum dolor amet consectetur.")
                .font(.system(size: 14))
                .lineLimit(1)
            Spacer()
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.darkBlue)
                Text("중구 필동로 1길 30").lineLimit(1)
                Image(systemName: "bookmark")
                    .foregroundColor(.darkBlue)
                Text("99")
                Image(systemName: "bubble.right")
                    .foregroundColor(.darkBlue)
                Text("123")
            }.font(.system(size: 13, weight: .bold))
        }.foregroundColor(.darkGray)
            .padding(.vertical, 5).padding(.bottom, 3)
    }.frame(height: 85).padding(.horizontal, 15).padding(.vertical, 5)
}
