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
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            // MARK: 커뮤니티 맵 뷰 검색 바
            HStack {
                TextField("게시글 제목, 내용, 태그, 닉네임으로 검색", text: $searchText)
                    .font(.system(size: 14))
                    .padding(.leading, 10)
                    .padding(.vertical, 8)
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.lightGray)
                    .font(.system(size: 24))
                    .padding(5)
            }.background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: .shadowGray, radius: 2, y: 2)
            }
            .padding(.horizontal, 22)
            
            Spacer()
            
            HStack {
                Spacer()
                VStack {
                    floatingButton(buttonOption: .bookmark)
                    floatingButton(buttonOption: .write)
                }.padding(.trailing, 10)
            }.padding(.bottom, 20)
        }
    }
    
    private func floatingButton(buttonOption: FloatingButtonOption) -> some View {
        return Button {
            
        } label: {
            switch buttonOption {
            case .bookmark:
                Image(systemName: "bookmark.fill")
                    .font(.system(size: 25))
                    .padding(15)
                    .background(Color.lightYellow)
            case .write:
                Image(systemName: "pencil")
                    .font(.system(size: 27))
                    .padding(13)
                    .background(Color.darkBlue)
                    .clipShape(Circle())
            }
        }.foregroundColor(.white)
            .clipShape(Circle())
            .shadow(color: .shadowGray, radius: 2, y: 2)
    }
}
