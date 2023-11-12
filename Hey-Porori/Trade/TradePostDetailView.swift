//
//  TradePostDetailView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/17.
//

import SwiftUI

struct TradePostDetailView: View {
    let postData: TradePostData
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            DefaultHeaderViewWithArray(headerText: "게시글 상세")
            Divider().padding(.vertical, 5)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Image("\(postData.imageURL)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.bottom, 10)
                    HStack {
                        Image(systemName: "heart.fill")
                            .font(Font(.size16))
                            .foregroundColor(.pink)
                            .padding(.trailing, -3)
                        Text("\(postData.recommend)")
                            .foregroundColor(.pink)
                            .defaultStyle_Bold(size: .size14)
                        Text("김포아지매")
                            .defaultGrayStyle_Bold(size: .size16)
                        Spacer()
                        Text("2023.11.08")
                            .defaultGrayStyle(size: .size14)
                        Text("필동")
                            .foregroundColor(.white)
                            .defaultStyle_Bold(size: .size16)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.darkBlue)
                            }
                    }.padding(.bottom, 30)
                    
                    HStack {
                        Text("\(postData.title)")
                            .defaultGrayStyle_Bold(size: .size24)
                            .padding(.bottom, 5)
                        Spacer()
                    }
                    Text("플레이하고 나서 바로 되파는 거라 흠집 같은 건 별로 없을 거에요.\n젤다 야숨은 5.5, 브릴리언트 다이아몬드는 4.5에 판매합니다.\n나머지 동숲 등등은 5.0입니다.")
                        .defaultGrayStyle(size: .size18)
                        .padding(.bottom, 20)
                    
                    HStack {
                        Spacer()
                        Button {
                            // TODO: 채팅하기
                        } label: {
                            Text("채팅하기")
                                .foregroundColor(.white)
                                .defaultStyle_Bold(size: .size20)
                                .padding(.horizontal, 17)
                                .padding(.vertical, 9)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.subSkyBlue)
                                }
                        }
                    }
                }
            }.padding(.horizontal, 25)
        }.toolbar(.hidden)
    }
}
