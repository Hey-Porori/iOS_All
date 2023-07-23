//
//  CommunityCreatePostView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/21.
//

import SwiftUI

struct CommunityCreatePostView: View {
    @Binding var createPostViewIsPresented: Bool
    
    var body: some View {
        VStack {
            // MARK: Header
            HStack {
                ZStack {
                    Text("게시글 작성").foregroundColor(.darkGray)
                        .font(.system(size: 19, weight: .bold))
                    HStack {
                        Button {
                            createPostViewIsPresented = false
                        } label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.darkGray)
                        }
                        Spacer()
                        Text("등록").font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color.white)
                            .padding(7).padding(.horizontal, 5)
                            .background(Color.subSkyBlue).cornerRadius(10)
                    }
                }
            }.padding(.horizontal, 13).padding(.top, 5)
            
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
            
            Spacer()
        }.background(Color.subSkyBlue005)
    }
}
