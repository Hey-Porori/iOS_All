//
//  JobPostCreateView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/08/27.
//

import SwiftUI
import Flow

let workList: [String] = ["서빙", "주방보조/설거지", "주방장/조리사", "매장관리/판매", "음료 제조", "베이킹", "편의점", "과외/학원", "전단지 배포", "청소/미화", "가사/집정리", "돌봄/시팅", "등하원도우미", "심부름/소일거리", "기타"]

struct WorkType {
    let workTypeText: String
    var isSelected: Bool = false
}

struct JobCreatePostView: View {
    @Binding var isPresentJobCreatePostView: Bool
    @State var titleText: String = ""
    
    @State var workTypes: [WorkType] = workList.map { WorkType(workTypeText: $0)
    }

    var body: some View {
        VStack {
            DefaultHeaderView(headerText: "알바공고 쓰기", isViewPresented: $isPresentJobCreatePostView)
            Spacer()
            VStack {
                // MARK: 제목
                VStack(alignment: .leading) {
                    HStack {
                        Text("제목").defaultStyle_Bold(size: .size16)
                    }.padding(.leading, 3)
                    
                    TextField("제목을 입력하세요", text: $titleText)
                        .jobDefaultBackGround()
                        .font(Font(.size18, weight: .bold))
                }.padding(.bottom, 25)
                
                // MARK: 하는 일
                VStack(alignment: .leading) {
                    HStack {
                        Text("하는 일").defaultStyle_Bold(size: .size16)
                        Spacer()
                        Text("2/15")
                    }.padding(.leading, 3)
                    
                    HFlow(spacing: 8) {
                        ForEach(0..<workTypes.count, id: \.self) { index in
                            JobToggleButton(text: self.workTypes[index].workTypeText, isSelected: self.$workTypes[index].isSelected)
                        }
                    }
                    
                }.padding(.bottom, 25)
            }.padding(.horizontal, 25)
            Spacer()
        }.toolbar(.hidden)
    }
    
    struct JobToggleButton: View {
        let text: String
        @Binding var isSelected: Bool
        
        var body: some View {
            Button {
                isSelected.toggle()
            } label: {
                if isSelected {
                    Text("\(text)")
                        .defaultStyle_Bold(size: .size17)
                        .jobToggleBackground()
                } else {
                    Text("\(text)")
                        .defaultGrayStyle(size: .size17)
                        .jobToggleBackground()
                }
            }
        }
    }
}
