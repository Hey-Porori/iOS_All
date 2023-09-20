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
            .background(Color.lightGray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        VStack(alignment: .leading) {
            Text("동국대 컴공 4학년 학식 친구 구해요")
                .defaultStyle_Bold(size: .size16)
                .lineLimit(1)
            Spacer().frame(height: 3)
            Text("동국대학교 컴퓨터공학과 4학년입니다. 학식 같이 먹을 친구가 없어요. 친구 구합니다. 학식만 같이 먹고 집에 가셔도 됩니다.")
                .defaultStyle(size: .size14)
                .lineLimit(1)
            Spacer()
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.darkBlue)
                Text("중구 필동로 1길 30")
                    .defaultStyle_Bold()
                    .lineLimit(1)
                Image(systemName: "bookmark")
                    .foregroundColor(.darkBlue)
                Text("99").defaultStyle_Bold()
                Image(systemName: "bubble.right")
                    .foregroundColor(.darkBlue)
                Text("123").defaultStyle_Bold()
            }
        }.foregroundColor(.darkGray)
            .padding(.vertical, 5).padding(.bottom, 3)
    }.frame(height: 85).padding(.horizontal, 15).padding(.vertical, 5)
}
