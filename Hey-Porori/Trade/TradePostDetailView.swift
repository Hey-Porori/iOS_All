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
            
            ScrollView(showsIndicators: false){
                VStack {
                    Image("dummyImage")
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
                        Text("12")
                            .foregroundColor(.pink)
                            .defaultStyle_Bold(size: .size14)
                        Text("김포아지매")
                            .defaultGrayStyle_Bold(size: .size16)
                        Spacer()
                        Text("2023.05.21")
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
                    Text("없으면 하였으며, 풀밭에 곳으로 평화스러운 피고 찾아다녀도, 현저하게 찬미를 아름다우냐? 무엇을 심장은 피가 인생에 것이다. 하여도 얼음이 거친 따뜻한 과실이 광야에서 것이다. 않는 능히 이상의 가슴에 장식하는 뜨거운지라, 부패뿐이다. 때에, 청춘의 새가 갑 귀는 않는 철환하였는가? 크고 그들에게 동력은 할지라도 꽃이 사막이다. 뭇 소금이라 너의 많이 노래하며 그림자는 얼마나 가장 열락의 말이다. 이상을 이상 보는 말이다. 유소년에게서 그들의 피고, 철환하였는가?  산야에 칼이다.  풀밭에 인간은 싶이 보라. 우리의 힘차게 이상은 청춘 평화스러운 얼마나")
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

