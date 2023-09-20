//
//  ClubPostDetailView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/21.
//

import SwiftUI

struct ClubCommentData: Identifiable, Hashable {
    var id: Int
    
    var userPhotoURL: String
    var userName: String
    var commentText: String
}

struct ClubPostDetailView: View {
    let clubData: ClubData
    let postData: ClubPostData
    
    var dummyComments: [ClubCommentData] {
        var data: [ClubCommentData] = []
        for i in 1...5 {
            data.append(ClubCommentData(id: i, userPhotoURL: "", userName: "김아현", commentText: "산 조치요~ 횐님도 건강하십쇼~!"))
        }
        
        return data
    }
    
    var body: some View {
        VStack {
            DefaultHeaderViewWithArray(headerText: clubData.clubName)
            Spacer()
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        clubPostRoundedBox(text: "#\(postData.subject.rawValue)")
                        Spacer()
                    }
                    
                    // MARK: 제목 본문 등등
                    VStack(alignment: .leading) {
                        Text("\(postData.title)")
                            .defaultStyle_Bold(size: .size17)
                            .padding(.bottom, 4)
                        Text("\(postData.content)")
                            .defaultStyle(size: .size15)
                        Text("\(postData.userID) · 3분 전")
                            .defaultGrayStyle(size: .size14)
                            .padding(.top, 5)
                            .multilineTextAlignment(.leading)
                    }.padding(.leading, 11)
                    Divider()
                    Text("댓글 3")
                        .defaultGrayStyle_Bold(size: .size15)
                        .padding(.leading, 11)
                        .padding(.bottom, 7)
                    
                    // MARK: 댓글
                    VStack {
                        ForEach(dummyComments) { comment in
                            clubPostCommentBox(commentData: comment)
                        }
                    }.padding(.horizontal, 25).padding(.bottom, 20)
                    
                }.padding(.top, 10).background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .defaultShadow()
                }.padding(.top, 10)
            }.background(Color.subSkyBlue.opacity(0.1))
        }.toolbar(.hidden)
    }
    
    private func clubPostCommentBox(commentData: ClubCommentData) -> some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                Image("dummyImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .background(.white)
                    .clipShape(Circle())
                    .background {
                        Circle()
                            .fill(Color.subSkyBlue)
                            .frame(width: 40, height: 40)
                    }.padding(.vertical, 15)
                    .padding(.leading, 15)
                VStack(alignment: .leading) {
                    Text("\(commentData.userName)")
                        .defaultGrayStyle_Bold(size: .size16)
                    Text("\(commentData.commentText)")
                        .defaultGrayStyle(size: .size15)
                }.padding(.vertical, 10)
                Spacer()
            }
            Text("1시간 전")
                .foregroundColor(.lightGray)
                .defaultStyle(size: .size14)
                .padding(10)
        }.background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .defaultShadow()
        }
    }
}
