//
//  JobPostFilterView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/05.
//

import SwiftUI
import Flow

enum 근무지역범위: String {
    case walk = "걸어서 갈래요! (2km 이내)"
    case min20 = "대중교통으로 20분까진 괜찮아요! (4km 이내)"
    case min30 = "대중교통으로 30분까진 괜찮아요! (6km 이내)"
}

struct JobPostFilterView: View {
    @Binding var isPresentjobPostFilterView: Bool
    @State var 근무지역: 근무지역범위 = .walk
    
    @State private var workTypeSelectedCount: Int = 0
    @State private var workTypes: [SelectBlock] = workList.map { SelectBlock(text: $0)
    }
    @State private var workTimeSelectedCount: Int = 0
    @State private var workTimes: [SelectBlock] = workTimeTextList.map { SelectBlock(text: $0) }
    @State private var isWorkTime협의제외: Bool = false
    @State private var workDays: [SelectBlock] = dayList.map { SelectBlock(text: $0) }
    @State private var startTime = "09:00"
    @State private var endTime = "18:00"
    @State private var isWorkTimeInterval협의가능: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            DefaultHeaderView(headerText: "검색조건 설정", isViewPresented: $isPresentjobPostFilterView)
            ScrollView {
                JobPostSection(title: "근무 지역") {
                    Text("'내 집'에서")
                        .defaultStyle(size: .size12)
                        .padding(.leading, 4)
                        .padding(.top, 2)
                    
                    // MARK: 근무 지역
                    JobPostFilter근무지역(근무지역: $근무지역)
                        .padding(.bottom, 20)
                    
                    // MARK: 하는 일
                    JobPostSection_Right(title: "하는 일") {
                        HStack(spacing: 0) {
                            Text("\(workTypeSelectedCount)")
                                .foregroundColor(.lightOrange)
                            Text("/\(workTypes.count)")
                        }
                    } bottomComponent: {
                        Text("하고 싶은 일을 선택해 주세요.")
                            .defaultStyle(size: .size12)
                            .padding(.leading, 4)
                            .padding(.top, 2)
                        
                        HFlow(spacing: 8) {
                            ForEach(0..<workTypes.count, id: \.self) { index in
                                ToggleButton(text: self.workTypes[index].text, isSelected: self.$workTypes[index].isSelected, selectedCount: $workTypeSelectedCount)
                            }
                        }
                    }
                    
                    // MARK: 근무 기간
                    JobPostSection_Right(title: "근무 기간") {
                        HStack(spacing: 0) {
                            Text("\(workTimeSelectedCount)")
                                .foregroundColor(.lightOrange)
                            Text("/\(workTimes.count)")
                        }
                    } bottomComponent: {
                        HFlow(spacing: 8) {
                            ForEach(0..<workTimes.count, id: \.self) { index in
                                ToggleButton(text: self.workTimes[index].text, isSelected: self.$workTimes[index].isSelected, selectedCount: $workTimeSelectedCount)
                            }
                        }
                        // MARK: 근무 기간 협상 가능
                        HStack {
                            Button {
                                isWorkTime협의제외.toggle()
                            } label: {
                                Image(systemName: isWorkTime협의제외 ? "checkmark.circle.fill" : "checkmark.circle")
                                    .font(Font(.size22))
                                    .foregroundColor(.mainBlue)
                            }
                            Text("협의 제외").defaultStyle_customWeight(size: .size15, weight: .medium)
                            Spacer()
                        }
                    }
                    
                    // MARK: 근무 요일
                    JobPostSection(title: "근무 요일") {
                        HFlow {
                            ForEach(0..<workDays.count, id: \.self) { index in
                                ToggleCircleButton(text: self.workDays[index].text, isSelected: self.$workDays[index].isSelected)
                                
                            }
                            Spacer()
                        }
                    }
                    
                    // MARK: 근무 시간
                    JobPostSection(title: "근무 시간") {
                        HStack {
                            TimeDropDownView(selectedTime: $startTime)
                            Text("~").defaultStyle_Bold(size: .size18)
                            TimeDropDownView(selectedTime: $endTime)
                        }
                        // MARK: 근무 시간 협의 가능
                        HStack {
                            Button {
                                isWorkTimeInterval협의가능.toggle()
                            } label: {
                                Image(systemName: isWorkTimeInterval협의가능 ? "checkmark.circle.fill" : "checkmark.circle")
                                    .font(Font(.size22))
                                    .foregroundColor(.mainBlue)
                            }
                            Text("협의 가능").defaultStyle_customWeight(size: .size15, weight: .medium)
                            Spacer()
                        }.padding(.bottom, 25)
                    }
                    
                }
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal, 23)
            Spacer()
        }.toolbar(.hidden)
    }
    
    // MARK: 근무 지역
    private struct JobPostFilter근무지역: View {
        @Binding var 근무지역: 근무지역범위
        
        var body: some View {
            VStack {
                근무지역SelectButton(근무지역Case: .walk)
                근무지역SelectButton(근무지역Case: .min20)
                근무지역SelectButton(근무지역Case: .min30)
            }
        }
        
        private func 근무지역SelectButton(근무지역Case: 근무지역범위) -> some View {
            return Button {
                근무지역 = 근무지역Case
            } label: {
                ZStack {
                    Text("\(근무지역Case.rawValue)")
                        .defaultStyle(size: .size15)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 11)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background {
                            if 근무지역 == 근무지역Case {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.dividerGray.opacity(0.3))
                            } else {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                            }
                        }.overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.dividerGray, lineWidth: 1)
                        )
                    
                    if 근무지역 == 근무지역Case {
                        HStack {
                            Spacer()
                            Image(systemName: "checkmark")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.trailing, 15)
                        }
                    }
                }
            }.padding(.vertical, 1)
        }
    }
}

