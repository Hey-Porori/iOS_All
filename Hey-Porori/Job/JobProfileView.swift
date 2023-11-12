//
//  JobProfileView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/12.
//

import SwiftUI

struct JobProfileView: View {
    private enum 지원서현황: String {
        case 전체
        case 응답대기
        case 연락중
        case 채용됨
    }
    
    @Binding var isPresentJobProfileView: Bool
    
    @State private var 지원서상태: 지원서현황 = .전체
    
    // dummy data
    private var dummyList: [JobPostData] {
        var list = [JobPostData]()
        list.append(JobPostData(id: 1, title: "초중등 수학 파트선생님 모집", location: "현수학학원 (잠실동)", postTime: "14분 전", payPerTime: "14000", workTime: "월~금 | 09:00~18:00 협의", imageURL: "jobIcon1"))
        list.append(JobPostData(id: 2, title: "위례일품양 점심 파트타임 모집", location: "하남시 위례대로 190", postTime: "2시간 전", payPerTime: "12000", workTime: "월~금 | 10:30~14:30", imageURL: "jobIcon1"))
        list.append(JobPostData(id: 3, title: "세븐일레븐위례아이파크1호점 야간타임 알바 구함", location: "위례아이파크1차 상가E동", postTime: "3일 전", payPerTime: "15000", workTime: "화, 수, 토 | 22:00~07:00", imageURL: "jobIcon1"))
        
        return list
    }
    
    var body: some View {
        VStack {
            DefaultHeaderView(headerText: "프로필 설정", isViewPresented: $isPresentJobProfileView)
            Divider()
            VStack {
                // MARK: 프로필 사진, 이름, 번호..etc
                HStack {
                    Image(systemName: "person")
                        .frame(width: 100, height: 100)
                    Spacer().frame(width: 29)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("김민수").defaultStyle_Bold(size: .size18)
                        Text("여성 | 20대 | 창곡동").defaultGrayStyle_Bold(size: .size16)
                        Text("010-1234-5678").defaultGrayStyle_Bold(size: .size15)
                    }
                    Spacer()
                }.padding(.bottom, 28)
                
                // MARK: 내 이력서 관리
                Button {
                    // TODO: 이력서 관리 페이지
                } label: {
                    Text("내 이력서 관리")
                        .customStyle_Bold(size: .size20, color: .blue)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.buttonlightGray.opacity(0.7))
                        }
                }
                
                Divider().padding(.vertical, 15)
                
                // MARK: 이력서 상태 버튼
                HStack(alignment: .center, spacing: 10) {
                    이력서상태버튼(상태: .전체)
                    이력서상태버튼(상태: .응답대기)
                    이력서상태버튼(상태: .연락중)
                    이력서상태버튼(상태: .채용됨)
                }.padding(.bottom, 25)
                
                // MARK: 이력서 리스트
                ScrollView {
                    ForEach(dummyList) { item in
                        NavigationLink(value: item) {
                            jobPostRow(postData: item)
                        }
                    }.navigationDestination(for: JobPostData.self) { item in
                        JobPostDetailView(postData: item)
                    }
                }.scrollIndicators(.hidden)
                
            }.padding(.horizontal, 24)
            Spacer()
        }.toolbar(.hidden)
    }
    
    private func 이력서상태버튼(상태: 지원서현황) -> some View {
        return Button {
            지원서상태 = 상태
        } label: {
            if 상태 == .응답대기 || 상태 == .전체 {
                Text("\(상태.rawValue) 3").defaultStyle_customWeight(size: .size12, weight: .semibold)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 10)
                    .background {
                        if 지원서상태 == 상태 {
                            RoundedRectangle(cornerRadius: 7)
                                .fill(Color.dividerGray)
                        } else {
                            RoundedRectangle(cornerRadius: 7)
                                .fill(Color.white)
                        }
                    }.overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .inset(by: 0.5)
                            .stroke(Color.dividerGray, lineWidth: 1)
                    )
            } else {
                Text("\(상태.rawValue) 0").defaultStyle_customWeight(size: .size12, weight: .semibold)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 10)
                    .background {
                        if 지원서상태 == 상태 {
                            RoundedRectangle(cornerRadius: 7)
                                .fill(Color.dividerGray)
                        } else {
                            RoundedRectangle(cornerRadius: 7)
                                .fill(Color.white)
                        }
                    }.overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .inset(by: 0.5)
                            .stroke(Color.dividerGray, lineWidth: 1)
                    )
            }
        }
    }
}
