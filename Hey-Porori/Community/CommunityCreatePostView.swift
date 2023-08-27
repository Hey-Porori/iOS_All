//
//  CommunityCreatePostView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/21.
//

import SwiftUI

struct CommunityCreatePostView: View {
    @Binding var createPostViewIsPresented: Bool
    @State private var titleText = ""
    @State private var contentText = ""
    
    var headerRightButton: some View {
        Text("등록").font(.system(size: 17, weight: .bold))
            .foregroundColor(Color.white)
            .padding(7).padding(.horizontal, 5)
            .background(Color.subSkyBlue).cornerRadius(10)
    }
    
    var body: some View {
        VStack {
            rightButtonHeaderView(headerText: "게시글 작성", isViewPresented: $createPostViewIsPresented, rightComponent: headerRightButton)
            
            Spacer().frame(height: 20)
            
            // MARK: Location
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.darkBlue)
                    .font(Font(.size19))
                Text("중구 필동로 1길 30")
                    .foregroundColor(.darkGray)
                    .defaultStyle_Bold(size: .size15)
                Image(systemName: "arrow.counterclockwise")
                    .foregroundColor(.darkGray)
                    .font(Font(.size19, weight: .bold))
            }
            
            Spacer().frame(height: 20)
            
            VStack(alignment: .leading) {
                // MARK: 제목
                VStack(alignment: .leading) {
                    HStack {
                        Text("제목").defaultStyle_Bold(size: .size16)
                            .padding(.trailing, -8)
                        Text("*").customStyle(size: .size20, color: .darkBlue)
                    }.padding(.leading, 3)
                    
                    TextField("제목을 입력하세요", text: $titleText)
                        .defaultBackground()
                        .font(Font(.size18, weight: .bold))
                }.padding(.bottom, 25)
                
                // MARK: 내용
                VStack(alignment: .leading) {
                    HStack {
                        Text("내용").defaultStyle_Bold(size: .size16)
                            .padding(.trailing, -8)
                        Text("*").customStyle(size: .size20, color: .darkBlue)
                    }.padding(.leading, 3)
                    
                    TextEditor(text: $contentText)
                        .defaultBackground()
                        .font(Font(.size17))
                }.padding(.bottom, 25)
                
                // MARK: 첨부파일
                VStack(alignment: .leading) {
                    Text("첨부 파일").defaultStyle_Bold(size: .size16)
                    
                    HStack {
                        Image("dummyImage")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .defaultShadow()
                        Image("dummyImage")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .defaultShadow()
                        Image("dummyImage")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .defaultShadow()
                        Image("dummyImage")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .defaultShadow()
                    }
                }.padding(.bottom, 25)
                
                // MARK: 태그)
                VStack(alignment: .leading) {
                    Text("태그").defaultStyle_Bold(size: .size16)
                    HStack {
                        Text("")
                    }.defaultBackground()
                }
                
            }.padding(.horizontal, 24)
            
            Spacer()
        }.background(Color.subSkyBlue005)
    }
}
