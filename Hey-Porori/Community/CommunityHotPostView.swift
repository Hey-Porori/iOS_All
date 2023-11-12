//
//  CommunityHotPostView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/16.
//

import SwiftUI

struct CommunityPostData: Identifiable, Hashable {
    var id: Int
    
    var imageURL: String
    var title: String
    var text: String
    var location: String
    var bookmark: Int
    var comment: Int
}

struct CommunityHotPostView: View {
    var dummyPostData: [CommunityPostData] {
        var data: [CommunityPostData] = []
        data.append(CommunityPostData(id: 1, imageURL: "comIcon1", title: "동국대 컴공 4학년 학식 친구 구해요", text: "동국대학교 컴퓨터공학과 4학년입니다. 학식 같이 먹을 친구가 없어요. 친구 구합니다. 학식만 같이 먹고 집에 가셔도 됩니다.", location: "중구 필동로 1길 30", bookmark: 2, comment: 3))
        data.append(CommunityPostData(id: 2, imageURL: "comIcon2", title: "오늘 자료구조 과제 난이도 뭐임?;;", text: "진짜 개 어려운데 조교님 기간 좀 늘려주면 안되나 다른 강의 과제도 개많은데;;", location: "중구 필동로 1길 30", bookmark: 6, comment: 12))
        data.append(CommunityPostData(id: 3, imageURL: "comIcon3", title: "공모전 정보 뿌린다", text: "이 공모전 지원자 별로 없어서 지원만 하면 최소 장려상 먹고 들어갈 수 있다. 빨리 신청 ㄱㄱ", location: "중구 필동로 1길 30", bookmark: 129, comment: 33))
        
        return data
    }
    
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(dummyPostData, id: \.self) { data in
                    NavigationLink(value: data) {
                        communityPostRow(postData: data)
                    }
                }
                Spacer()
            }
        }
    }
}

func communityPostRow(postData: CommunityPostData) -> some View {
    return HStack {
        Image("\(postData.imageURL)")
            .resizable()
            .frame(width: 75, height: 75)
            .background(Color.lightGray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        VStack(alignment: .leading) {
            Text(postData.title)
                .defaultStyle_Bold(size: .size16)
                .lineLimit(1)
            Spacer().frame(height: 3)
            Text(postData.text)
                .defaultStyle(size: .size14)
                .lineLimit(1)
            Spacer()
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.darkBlue)
                Text(postData.location)
                    .defaultStyle_Bold()
                    .lineLimit(1)
                Image(systemName: "bookmark")
                    .foregroundColor(.darkBlue)
                Text("\(postData.bookmark)").defaultStyle_Bold()
                Image(systemName: "bubble.right")
                    .foregroundColor(.darkBlue)
                Text("\(postData.comment)").defaultStyle_Bold()
            }
        }.foregroundColor(.darkGray)
            .padding(.vertical, 5).padding(.bottom, 3)
    }.frame(height: 85).padding(.horizontal, 15).padding(.vertical, 5)
}
