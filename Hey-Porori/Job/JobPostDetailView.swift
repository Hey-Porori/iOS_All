//
//  JobPostDetailView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/08/05.
//

import SwiftUI

struct JobPostDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let postData: JobPostData
    
    // MARK: Navigation Back Button (Header)
    private var navigationBackButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left").font(Font(.size20)).foregroundColor(.black)
                Text("채용정보").defaultStyle_Bold(size: .size20)
            }
        }
    }
    
    // MARK: 알바 시급, 날짜, 시간 정보 표시
    private var jobDetailView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: "wonsign.circle").font(Font(.size20))
                    Text("시급 12,000원").defaultStyle(size: .size16)
                }
                HStack {
                    Image(systemName: "calendar").font(Font(.size20))
                    Text("월~일").defaultStyle(size: .size16)
                }
                HStack {
                    Image(systemName: "clock").font(Font(.size20))
                    Text("17:30~23:30").defaultStyle(size: .size16)
                }
                Spacer().frame(height: 15)
                Text("초보도 가능할 정도로 일 쉽습니다!\n열정만 있다면 할 수 있습니다.").defaultStyle(size: .size16)
                Spacer().frame(height: 10)
                Text("지원자 20 | 관심 19").defaultStyle(size: .size12)
            }
            Spacer()
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                navigationBackButton.padding(.leading, 10)
                Spacer()
            }.padding(.vertical, 10)
            ScrollView {
                // MARK: 메인 이미지
                Image("dummyImage")
                    .resizable()
                    .frame(height: 150)
                    .background(Color.lightGray)
                    .padding(.vertical, 10)
                    .padding(.bottom, 10)
                VStack {
                    // MARK: 제목 및 정보
                    HStack {
                        VStack(alignment: .leading) {
                            Text("위례일품양 파트타임 모집").defaultStyle_Bold(size: .size20)
                            Spacer().frame(height: 10)
                            Text("일품양 | 14분 전").defaultGrayStyle(size: .size17)
                        }
                        Spacer()
                        Image(systemName: "highlighter").font(Font(.size27))
                    }
                    Divider().frame(height: 1.5)
                        .foregroundColor(.dividerGray).padding(.vertical, 20)
                    // MARK: 알바 시급, 날짜, 시간 정보 표시
                    jobDetailView
                    // MARK: 지도(위치)
                    Image("dummyImage")
                        .resizable()
                        .frame(width: 350, height: 180)
                        .background(Color.lightGray)
                        .padding(.vertical, 10)
                }.padding(.horizontal, 25)
            }
            Text("지원하기")
                .customStyle_Bold(size: .size22, color: .white)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.subSkyBlue)
                }.padding(.horizontal, 18)
        }.navigationBarBackButtonHidden(true)
    }
}
