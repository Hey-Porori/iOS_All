//
//  ClubCommunityView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/19.
//

import SwiftUI

enum ClubPostSubject: String, CaseIterable, Identifiable {
    case 인기글
    case 같이가요
    case 질문
    case 정보
    
    var id: ClubPostSubject {
        self
    }
}

struct ClubPostData: Identifiable, Hashable {
    var id: Int
    
    var userID: String
    var clubID: Int
    var title: String
    var content: String
    var isImportant: Bool
    var subject: ClubPostSubject
    var postDate: Int
}

struct ClubCommunityView: View {
    let clubData: ClubData
    
    var dummyPostData: [ClubPostData] {
        var data: [ClubPostData] = []
        data.append(ClubPostData(id: 1, userID: "신사임당", clubID: 123, title: "이번 주 일요일 남한산성 등산 하실 분 모집해요", content: "안녕하세요 초보 등산러입니다.\n이번주 일요일(5월 28일) 남한산성 등산하실 분~\n산 타고 나서 점심 같이 먹고 헤어져요 ", isImportant: false, subject: .같이가요, postDate: 2))
        data.append(ClubPostData(id: 2, userID: "내연산멋쟁이", clubID: 123, title: "내연산 맛집 공유드립니다", content: "내연산 다녀오실 분들 여긴 꼭 가셔야 합니다\n여기가 진짜 찐 삼계탕 맛집이에요\n등산 한 번 하고 삼계탕 한 그릇이면 이게 천국입니다", isImportant: false, subject: .정보, postDate: 9))
        data.append(ClubPostData(id: 3, userID: "금지팡이은지팡이", clubID: 123, title: "등산용 지팡이 추천좀 해주세요", content: "안녕하세요 등린이입니다.\n지팡이 하나 장만하려 하는 데 어느 회사 것이 좋은가요?\n역시 애플의 i-지팡이가 좋겠죠?", isImportant: false, subject: .질문, postDate: 14))
        return data
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: 헤더
            RightButtonHeaderViewWithArray(headerText: clubData.clubName) {
                Button {
                    // TODO: Club Exit
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .defaultHeaderIcon()
                }
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(ClubPostSubject.allCases) { text in
                        clubPostRoundedBox(text: "#\(text)")
                    }
                }.padding(.leading, 12)
            }.padding(.bottom, 3)
            
            HStack {
                clubPostRoundedBox(text: "공지")
                Text("2023년 11월 12일 등산 관련")
                    .defaultStyle(size: .size15)
            }.padding(.leading, 12)
            
            ScrollView {
                VStack {
                    ForEach(dummyPostData, id: \.self) { data in
                        NavigationLink(value: data) {
                            clubPostBox(postData: data)
                        }
                    }
                }.navigationDestination(for: ClubPostData.self) { postData in
                    ClubPostDetailView(clubData: clubData, postData: postData)
                }
            }.background(Color.subSkyBlue.opacity(0.1))
        }.toolbar(.hidden)
    }
    
    private func clubPostBox(postData: ClubPostData) -> some View {
        VStack(alignment: .leading) {
            HStack {
                clubPostRoundedBox(text: "#\(postData.subject.rawValue)")
                Text("\(postData.title)")
                    .defaultStyle_Bold(size: .size16)
                    .lineLimit(1)
            }.padding(.leading, 11)
            VStack(alignment: .leading) {
                Text("\(postData.content)")
                    .defaultStyle(size: .size15)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                Text("\(postData.userID) · \(postData.postDate)시간 전")
                    .defaultGrayStyle(size: .size13)
                    .padding(.top, 5)
            }.padding(.leading, 16)
            Divider()
            Text("댓글 3")
                .defaultGrayStyle_Bold(size: .size15)
                .padding(.leading, 11)
                .padding(.bottom, 7)
        }.padding(.top, 10)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .defaultShadow()
            }.padding(.top, 10)
    }
}

func clubPostRoundedBox(text: String) -> some View {
    return Text("\(text)")
        .foregroundColor(.white)
        .defaultStyle_Bold(size: .size15)
        .padding(.vertical, 4)
        .padding(.horizontal, 10)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.subSkyBlue)
        }
}
