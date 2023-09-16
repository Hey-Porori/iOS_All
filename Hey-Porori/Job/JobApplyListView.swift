//
//  ApplyListView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/12.
//

import SwiftUI

// TODO: 임시 job Post Data 저장용 struct. 추후 변경 요함
struct JobApplyData: Identifiable, Hashable {
    var id: Int
    
    var postID: Int
    var name: String
    var phone: String
    var isMale: Bool
    var age: Int
    var location: String
}

struct JobApplyListView: View {
    @Binding var isPresentApplyListView: Bool
    
    // dummy data
    private var dummyList: [JobApplyData] {
        var list = [JobApplyData]()
        for listID in 0..<5 {
            let dummy = JobApplyData(id: listID, postID: listID, name: "김민수", phone: "010-1234-5678", isMale: false, age: 24, location: "창곡동")
            list.append(dummy)
        }
        return list
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            DefaultHeaderView(headerText: "지원 현황 보기", isViewPresented: $isPresentApplyListView)
            Divider()
            ScrollView(showsIndicators: false) {
                ForEach(dummyList) { applyItem in
                    NavigationLink(value: applyItem) {
                        jobApplyRow(applyData: applyItem)
                    }
                }.navigationDestination(for: JobApplyData.self) { postItem in
                    //
                }
            }.padding(.horizontal, 25)
        }.toolbar(.hidden)
    }
    
    private func jobApplyRow(applyData: JobApplyData) -> some View {
        return HStack {
            Image(systemName: "person")
                .foregroundColor(.black)
                .frame(width: 32, height: 32)
                .background(Color.dividerGray)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .padding(.trailing, 5)
            VStack(alignment: .leading, spacing: 3) {
                Text("\(applyData.isMale ? "남성" : "여성") | \(applyData.age)세 | \(applyData.location)")
                    .defaultGrayStyle(size: .size15)
                Text("\(applyData.name)").defaultStyle_Bold(size: .size15)
                Text("전화번호 : \(applyData.phone)").defaultStyle_Bold(size: .size15)
            }
            Spacer()
            Image(systemName: "chevron.forward").font(Font(.size18)).foregroundColor(.darkGray)
        }.frame(maxHeight: 95).padding(.top, 20)
    }

}
