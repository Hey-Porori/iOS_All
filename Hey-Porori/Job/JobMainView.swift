//
//  JobMainView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/08/05.
//

import SwiftUI

// TODO: 임시 job Post Data 저장용 struct. 추후 변경 요함
struct JobPostData {
    var title: String
    var location: String
    var postTime: String
    var payPerTime: String
    var workTime: String // dictionary 형태로 수정 요함
}

struct JobMainView: View {
    private let dummy: JobPostData = JobPostData(title: "초중등 수학 파트선생님 모집", location: "현수학학원 (잠실동)", postTime: "14분 전", payPerTime: "14000", workTime: "월~금 | 09:00~18:00 협의")
    
    @State var searchText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: Location, Icons Header
            HStack {
                Text("창곡동").defaultStyle_Bold(size: .size20)
                Image(systemName: "chevron.down").font(Font(.size18))
                Spacer()
                Image(systemName: "bell").font(Font(.size22))
                Image(systemName: "person").font(Font(.size22))
                Image(systemName: "highlighter").font(Font(.size22))
            }
            
            // MARK: Search Bar
            SearchTextBox(placeholder: "제목 등으로 검색하세요", searchText: $searchText)

            // MARK: Filter with Tag
            
            
            ScrollView {
                jobPostRow(postData: dummy)
                jobPostRow(postData: dummy)
                jobPostRow(postData: dummy)
                jobPostRow(postData: dummy)
                jobPostRow(postData: dummy)
            }
        }.padding(.horizontal, 24)
    }
    
    func jobPostRow(postData: JobPostData) -> some View {
        return HStack {
            VStack(alignment: .leading) {
                Text(postData.title).defaultStyle_Bold(size: .size17)
                Text("\(postData.location) | \(postData.postTime)")
                    .defaultStyle(size: .size15)
                Spacer()
                Text("시급 \(postData.payPerTime)원").defaultGrayStyle(size: .size15)
                Text("\(postData.workTime)").defaultStyle(size: .size15)
            }
            Spacer()
            Image(systemName: "chevron.forward").font(Font(.size18))
        }.frame(maxHeight: 95).padding(15)
    }
}
