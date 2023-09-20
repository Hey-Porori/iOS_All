//
//  ClubExploreView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/21.
//

import SwiftUI

struct ClubExploreView: View {
    @Binding var isClubMainView: Bool
    
    var dummyClubData: [ClubData] {
        var data: [ClubData] = []
        data.append(ClubData(id: 1, clubName: "산타는 할아버지", clubType: .등산, location: "서울시 송파구", currentMember: 8, maxMember: 10, mainPhotoURL: ""))
        data.append(ClubData(id: 2, clubName: "커피 한 잔의 여유와 독서", clubType: .독서, location: "서울시 중구", currentMember: 6, maxMember: 10, mainPhotoURL: ""))
        data.append(ClubData(id: 3, clubName: "맛따라 멋따라", clubType: .맛집, location: "서울시 마포구", currentMember: 13, maxMember: 15, mainPhotoURL: ""))
        return data
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                // MARK: 헤더
                ZStack {
                    HStack(alignment: .center) {
                        Text("동호회 둘러보기").defaultStyle_Bold(size: .size20)
                            .padding(.top, 5)
                    }
                    HStack(alignment: .bottom) {
                        Spacer()
                        Button {
                            isClubMainView.toggle()
                        } label: {
                            Text("내 동호회")
                                .foregroundColor(.white)
                                .defaultStyle_Bold(size: .size16)
                                .padding(5)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.subSkyBlue)
                                        .defaultShadow()
                                }
                        }.padding(.trailing, 20).padding(.top, 5)
                    }
                }
                
                ScrollView {
                    VStack {
                        ForEach(dummyClubData, id: \.self) { data in
                            NavigationLink(value: data) {
                                clubBox(data: data)
                            }
                        }
                    }.navigationDestination(for: ClubData.self, destination: { clubData in
                        ClubCommunityView(clubData: clubData)
                    })
                    .padding(.top, 10)
                }.padding(.horizontal, 20)
                    .background(Color.subSkyBlue.opacity(0.1))
            }
            
            // MARK: 플로팅 버튼 (동호회 생성)
            Button {
//                isPresentTradeCreatePostView = true
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 30, weight: .bold))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.subSkyBlue)
                    .clipShape(Circle())
            }.defaultShadow().padding()
//                .navigationDestination(isPresented: $isPresentTradeCreatePostView) {
//                TradeCreatePostView(isPresentTradeCreatePostView: $isPresentTradeCreatePostView)
//            }
        }
    }
}
