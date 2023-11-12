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
    var commentdate: Int
}

struct ClubPostDetailView: View {
    let clubData: ClubData
    let postData: ClubPostData
    
    var dummyComments: [ClubCommentData] {
        var data: [ClubCommentData] = []
        data.append(ClubCommentData(id: 1, userPhotoURL: "clubUser1", userName: "마법소녀김아현", commentText: "에이 그거보단 요즘 새로나온 i-지팡이 14 Pro Max가 낫죠", commentdate: 5))
        data.append(ClubCommentData(id: 2, userPhotoURL: "clubUser2", userName: "맛세이장인김예지", commentText: "무슨 애플이에요;; 갤럭시 지팡이가 최고지;;", commentdate: 12))
        data.append(ClubCommentData(id: 3, userPhotoURL: "clubUser3", userName: "소녀가장정지윤", commentText: "ㅋㅋ 다들 지팡이알못이네 요즘은 화웨이 지팡이가 짱임;", commentdate: 23))
        
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
                        Text("\(postData.userID) · \(postData.postDate)시간 전")
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
                Image("\(commentData.userPhotoURL)")
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
            Text("\(commentData.commentdate)분 전")
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
