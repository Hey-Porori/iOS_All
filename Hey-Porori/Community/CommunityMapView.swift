//
//  CommunityMapView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/16.
//

import SwiftUI

enum FloatingButtonOption {
    case bookmark
    case write
}

struct CommunityMapView: View {
    @State private var createPostViewIsPresented = false
    @State private var searchText = ""
    
    var body: some View {
            VStack {
                // MARK: 커뮤니티 맵 뷰 검색 바
                CommunitySearchTextBox(placeholder: "게시글 제목, 내용, 태그, 닉네임으로 검색", searchText: $searchText)
                .padding(.horizontal, 22)
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        floatingButton(buttonOption: .bookmark)
                        floatingButton(buttonOption: .write)
//                            .navigationDestination(isPresented: $createPostViewIsPresented) {
//                                CommunityCreatePostView()
//                            }
                    }.padding(.trailing, 10)
                }.padding(.bottom, 20)
            }.fullScreenCover(isPresented: $createPostViewIsPresented) {
            CommunityCreatePostView(createPostViewIsPresented: $createPostViewIsPresented)
        }
    }
    
    private func floatingButton(buttonOption: FloatingButtonOption) -> some View {
        return Button {
            switch buttonOption {
            case .bookmark:
                break
            case .write:
                createPostViewIsPresented = true
            }
        } label: {
            switch buttonOption {
            case .bookmark:
                Image(systemName: "bookmark.fill")
                    .font(Font(.size25))
                    .padding(15)
                    .background(Color.lightYellow)
            case .write:
                Image(systemName: "pencil")
                    .font(Font(.size27))
                    .padding(13)
                    .background(Color.darkBlue)
                    .clipShape(Circle())
            }
        }.foregroundColor(.white)
            .clipShape(Circle())
            .defaultShadow()
    }
}
