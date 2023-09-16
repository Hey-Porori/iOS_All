//
//  TradeCreatePostView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/17.
//

import SwiftUI

struct TradeCreatePostView: View {
    @Binding var isPresentTradeCreatePostView: Bool
    
    @State var titleText = ""
    @State var contentText = ""
    
    var body: some View {
        VStack {
            DefaultHeaderView(headerText: "게시글 작성", isViewPresented: $isPresentTradeCreatePostView)
            Divider().padding(.vertical, 5)
            ScrollView {
                VStack {
                    // MARK: 사진 삽입 버튼
                    Button {
                        //
                    } label: {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.system(size: 40))
                            .frame(maxWidth: .infinity).frame(height: 280)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(Color.gray, lineWidth: 1)
                    }.padding(.bottom, 20)
                    
                    // MARK: 제목, 내용
                    ZStack {
                        HStack {
                            TextField("제목", text: $titleText)
                                .roundedGrayBackGround()
                                .font(Font(.size22))
                        }
                        HStack {
                            Spacer()
                            Button {
                                titleText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .font(Font(.size19))
                                    .foregroundColor(.buttontGray)
                            }
                        }.padding(.trailing, 15)
                    }.padding(.bottom, 20)
                    
                    TextEditor(text: $contentText)
                        .roundedGrayBackGround()
                        .font(Font(.size16))
                        .padding(.bottom, 20)
                    
                    // MARK: 카테고리, 글 생성 버튼
                    HStack {
                        Button {
                            //
                        } label: {
                            Text("카테고리")
                                .foregroundColor(.gray)
                                .defaultStyle(size: .size18)
                                .padding(.horizontal, 18)
                                .padding(.vertical, 11)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.lightGray.opacity(0.3))
                                }
                        }
                        Spacer()
                        Button {
                            // TODO: 글 작성 버튼
                        } label: {
                            Text("글 작성")
                                .foregroundColor(.white)
                                .defaultStyle_Bold(size: .size18)
                                .padding(.horizontal, 18)
                                .padding(.vertical, 11)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.subSkyBlue)
                                }
                        }

                    }
                }.padding(.horizontal, 25)
            }
        }.toolbar(.hidden)
    }
}

