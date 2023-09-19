//
//  ClubMainView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/19.
//

import SwiftUI

enum ClubType: String {
    case 등산 = "취미/등산"
    case 독서 = "취미/독서"
    case 맛집 = "음식/맛집"
}

struct ClubData: Identifiable, Hashable {
    var id: Int
    
    var clubName: String
    var clubType: ClubType
    var location: String
    var currentMember: Int
    var maxMember: Int
    var mainPhotoURL: String
}

struct ClubMainView: View {
    var dummyClubData: [ClubData] {
        var data: [ClubData] = []
        data.append(ClubData(id: 1, clubName: "산타는 할아버지", clubType: .등산, location: "서울시 송파구", currentMember: 8, maxMember: 10, mainPhotoURL: ""))
        data.append(ClubData(id: 2, clubName: "커피 한 잔의 여유와 독서", clubType: .독서, location: "서울시 중구", currentMember: 6, maxMember: 10, mainPhotoURL: ""))
        data.append(ClubData(id: 3, clubName: "맛따라 멋따라", clubType: .맛집, location: "서울시 마포구", currentMember: 13, maxMember: 15, mainPhotoURL: ""))
        return data
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: 헤더
            ZStack {
                HStack(alignment: .center) {
                    Text("내 동호회").defaultStyle_Bold(size: .size20)
                        .padding(.top, 5)
                }
                HStack {
                    Spacer()
                    Button {
                        // TODO: 무슨버튼임?
                    } label: {
                        Image(systemName: "square.grid.2x2")
                            .font(Font(.size22))
                            .foregroundColor(.black)
                    }.padding(.trailing, 20)
                }
            }
            
            Divider().padding(.top, 10)
            
            ScrollView {
                VStack {
                    ForEach(dummyClubData, id: \.self) { data in
                        NavigationLink(value: data) {
                            clubBox(data: data)
                        }
                    }
                }.navigationDestination(for: ClubData.self, destination: { clubData in
                    ClubCommunityView()
                })
                .padding(.top, 10)
            }.padding(.horizontal, 20)
                .background(Color.subSkyBlue.opacity(0.1))
                
        }
    }
}

func clubBox(data: ClubData) -> some View {
    HStack {
        ZStack(alignment: .bottomTrailing) {
            HStack {
                // TODO: Image URL Loading 방식으로 변경
                Image("dummyImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.leading, 15)
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom) {
                        Text("\(data.clubName)").defaultStyle_Bold(size: .size19)
                        Text("\(data.clubType.rawValue)").defaultGrayStyle(size: .size12)
                    }
                    Text("\(data.location)").defaultGrayStyle(size: .size14)
                }
                Spacer()
            }
            Text("\(data.currentMember)/\(data.maxMember)").defaultStyle(size: .size14).padding(.trailing, 10)
        }
    }.padding(.vertical, 10).background {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .defaultShadow()
    }.padding(.vertical, 7)
}
