//
//  ClubDetailView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/21.
//

import SwiftUI

struct ClubDetailView: View {
    let clubData: ClubData
    
    var body: some View {
        VStack {
            DefaultHeaderViewWithArray(headerText: "\(clubData.clubName)")
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("동호회 정보")
                        .defaultStyle_Bold(size: .size18)
                    ClubDetailRowText(section: "주제", text: clubData.clubType.rawValue)
                    ClubDetailRowText(section: "활동지역", text: clubData.location)
                    ClubDetailRowText(section: "회원 수", text: "\(clubData.currentMember)/\(clubData.maxMember)")
                    
                    // MARK: 활동 사진
                    clubPostRoundedBox(text: "활동 사진")
                    ScrollView(.horizontal) {
                        HStack {
                            Image("dummyImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .background(Color.lightGray)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            Image("dummyImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .background(Color.lightGray)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            Image("dummyImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .background(Color.lightGray)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            Image("dummyImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .background(Color.lightGray)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }.padding(.bottom, 20)
                    
                    // MARK: 이런회원원합니다
                    VStack(alignment: .leading) {
                        Text("이런 회원을 원합니다!")
                            .defaultStyle_Bold(size: .size18)
                        Text("동호회 활동에 성실히 참여할 수 있는 분")
                            .defaultStyle(size: .size16)
                            .padding(5)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 1)
                                    .stroke(Color.subSkyBlue, lineWidth: 1)
                            }
                        Text("동호회 활동에 다른 목적을 갖고 참여하지 않는 분")
                            .defaultStyle(size: .size16)
                            .padding(5)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 1)
                                    .stroke(Color.subSkyBlue, lineWidth: 1)
                            }
                    }.padding(.bottom, 30)
                    
                    // MARK: 동호회 가입 신청 버튼
                    HStack {
                        Spacer()
                        Button {
                            // TODO: 동호회 가입 신청
                        } label: {
                            Text("동호회 가입 신청")
                                .foregroundColor(.white)
                                .defaultStyle_Bold(size: .size19)
                                .padding(10)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.subSkyBlue)
                                        .defaultShadow()
                                }
                        }
                        Spacer()
                    }.padding(.bottom, 30)

                }.padding(.top, 10).padding(.horizontal, 15)
                .background(Color.white).padding(.top, 10)
            }.background(Color.subSkyBlue.opacity(0.1))
        }.toolbar(.hidden)
    }
    
    private func ClubDetailRowText(section: String, text: String) -> some View {
        HStack(alignment: .center) {
            clubPostRoundedBox(text: section)
            Text(text).defaultStyle(size: .size16)
        }
    }
}
