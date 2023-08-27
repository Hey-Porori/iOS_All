//
//  JobMainView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/08/05.
//

import SwiftUI

// TODO: 임시 job Post Data 저장용 struct. 추후 변경 요함
struct JobPostData: Identifiable, Hashable {
    var id: Int
    
    var title: String
    var location: String
    var postTime: String
    var payPerTime: String
    var workTime: String // dictionary 형태로 수정 요함
}

struct JobMainView: View {
    // dummy data
    private var dummyList: [JobPostData] {
        var list = [JobPostData]()
        for listID in 0..<5 {
            let dummy = JobPostData(id: listID, title: "초중등 수학 파트선생님 모집", location: "현수학학원 (잠실동)", postTime: "14분 전", payPerTime: "14000", workTime: "월~금 | 09:00~18:00 협의")
            list.append(dummy)
        }
        return list
    }
    
    @State private var dummyShown: JobPostData?
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
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
                HStack {
                    Image(systemName: "slider.horizontal.3").font(Font(.size23))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            filterBox(content: "창곡동 외 7건")
                            filterBox(content: "기간")
                            filterBox(content: "하는 일")
                            filterBox(content: "요일")
                        }
                    }
                }.padding(.top, 5)
                
                ScrollView {
                    ForEach(dummyList) { item in
                        NavigationLink(value: item) {
                            jobPostRow(postData: item)
                        }
                    }.navigationDestination(for: JobPostData.self) { item in
                        JobPostDetailView(postData: item)
                    }
                }
            }.padding(.horizontal, 24)
        }
        
    }
    
    private func jobPostRow(postData: JobPostData) -> some View {
        return HStack {
            VStack(alignment: .leading) {
                Text(postData.title).defaultStyle_Bold(size: .size17)
                Text("\(postData.location) | \(postData.postTime)")
                    .defaultStyle(size: .size15)
                Spacer()
                Text("시급 \(postData.payPerTime)원").defaultGrayStyle(size: .size15)
                Text("\(postData.workTime)").defaultGrayStyle(size: .size15)
            }
            Spacer()
            Image(systemName: "chevron.forward").font(Font(.size18)).foregroundColor(.darkGray)
        }.frame(maxHeight: 95).padding(.top, 20)
    }
    
    private func filterBox(content: String) -> some View {
        return HStack {
            Text("\(content)").customStyle_Bold(size: .size14, color: .white).padding(.trailing, -3).lineLimit(1)
            Image(systemName: "chevron.down").font(Font(.size14, weight: .bold)).foregroundColor(.white)
        }.padding(5).padding(.horizontal, 5).background {
            RoundedRectangle(cornerRadius: 7)
                .fill(Color.darkBlue)
        }
    }
}
