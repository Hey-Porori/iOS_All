//
//  CommunityCreatePostView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/21.
//

import SwiftUI

struct CommunityCreatePostView: View {
    @Binding var createPostViewIsPresented: Bool
    @State private var titleText = "동국대 컴공 4학년 학식 친구 구해요"
    @State private var contentText = "동국대학교 컴퓨터공학과 4학년입니다.\n학식 같이 먹을 친구가 없어요.\n친구 구합니다.\n학식만 같이 먹고 가셔도 됩니다.\n학식 먹고 아메리카노 한 잔 정도는 사드립니다.\n아니면 같이 아레나 PC방 가서 롤 한 판이라도 하시죠."
    
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
                        .defaultBackground_Shadow()
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
                    
                    ScrollView(.horizontal) {
                        HStack {
                            Image(systemName: "plus")
                                .font(.system(size: 30))
                                .foregroundColor(.lightGray)
                                .frame(width: 75, height: 75)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .defaultShadow()
                            Image("comIcon1")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .defaultShadow()
                        }.padding(5)
                    }
                }.padding(.bottom, 25)
                
                // MARK: 태그
                VStack(alignment: .leading) {
                    Text("태그").defaultStyle_Bold(size: .size16)
                    HStack {
                        Image(systemName: "plus")
                            .foregroundColor(.darkBlue)
                            .font(.system(size: 15, weight: .bold))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 7)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(style: StrokeStyle(lineWidth: 1.5, dash: [5, 2.5]))  // 선길이, 간격
                                    .foregroundColor(.darkBlue)
                            )
                    }.defaultBackground()
                }
                
            }.padding(.horizontal, 24)
            
            Spacer()
        }.background(Color.subSkyBlue005)
    }
}
