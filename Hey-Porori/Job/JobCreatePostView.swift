//
//  JobPostCreateView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/08/27.
//

import SwiftUI
import Flow

let workList: [String] = ["서빙", "주방보조/설거지", "주방장/조리사", "매장관리/판매", "음료 제조", "베이킹", "편의점", "과외/학원", "전단지 배포", "청소/미화", "가사/집정리", "돌봄/시팅", "등하원도우미", "심부름/소일거리", "기타"]

let workTimeTextList: [String] = ["하루(1일)", "1주일 이하", "1주일~1개월", "1개월~3개월", "3개월~6개월", "6개월~1년", "1년 이상"]

let dayList: [String] = ["월", "화", "수", "목", "금", "토", "일"]

struct SelectBlock {
    let text: String
    var isSelected: Bool = false
}

enum PayType: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    
    case 시급
    case 일급
    case 월급
    case 연봉
}

struct JobCreatePostView: View {
    @Binding var isPresentJobCreatePostView: Bool
    @State private var titleText = ""
    
    @State private var workTypeSelectedCount: Int = 0
    @State private var workTypes: [SelectBlock] = workList.map { SelectBlock(text: $0)
    }
    @State private var workTimeSelectedCount: Int = 0
    @State private var workTimes: [SelectBlock] = workTimeTextList.map { SelectBlock(text: $0) }
    @State private var isWorkTime협상가능: Bool = false
    @State private var workDays: [SelectBlock] = dayList.map { SelectBlock(text: $0) }
    @State private var startTime = "09:00"
    @State private var endTime = "18:00"
    @State private var isWorkTimeInterval협상가능: Bool = false
    @State private var payType: PayType = .시급
    
    @State private var detailText = ""
    @State private var payText = ""

    var body: some View {
        VStack {
            DefaultHeaderView(headerText: "알바공고 쓰기", isViewPresented: $isPresentJobCreatePostView)
            ScrollView {
                VStack {
                    // MARK: 제목
                    JobPostSection(title: "제목") {
                        TextField("제목을 입력하세요", text: $titleText)
                            .jobDefaultBackGround()
                            .font(Font(.size18, weight: .bold))
                    }
                    
                    // MARK: 하는 일
                    JobPostSection_Right(title: "하는 일") {
                        HStack(spacing: 0) {
                            Text("\(workTypeSelectedCount)")
                                .foregroundColor(.lightOrange)
                            Text("/\(workTypes.count)")
                        }
                    } bottomComponent: {
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
                                isWorkTime협상가능.toggle()
                            } label: {
                                Image(systemName: isWorkTime협상가능 ? "checkmark.circle.fill" : "checkmark.circle")
                                    .font(Font(.size22))
                                    .foregroundColor(.mainBlue)
                            }
                            Text("협상가능").defaultStyle_customWeight(size: .size15, weight: .medium)
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
                                isWorkTimeInterval협상가능.toggle()
                            } label: {
                                Image(systemName: isWorkTimeInterval협상가능 ? "checkmark.circle.fill" : "checkmark.circle")
                                    .font(Font(.size22))
                                    .foregroundColor(.mainBlue)
                            }
                            Text("협상가능").defaultStyle_customWeight(size: .size15, weight: .medium)
                            Spacer()
                        }.padding(.bottom, 25)
                    }
                    
                
                    
                    // MARK: 급여
                    JobPostSection(title: "급여") {
                        HStack {
                            PayDropDownView(selectedPayType: $payType)
                                .padding(.trailing, 30)
                            ZStack {
                                TextField("", text: $titleText)
                                    .font(Font(.size15, weight: .medium))
                                    .multilineTextAlignment(.trailing)
                                    .padding(.trailing, 20)
                                    .jobTextFieldCustomBackGround(lineWidth: 1)
                                HStack {
                                    Spacer()
                                    Text("원").defaultStyle_Bold(size: .size17)
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                    }
                    
                    // MARK: 상세 내용
                    JobPostSection(title: "상세 내용") {
                        ZStack {
                            HStack {
                                TextEditor(text: $detailText)
                                    .jobCustomBackGround()
                                    .font(Font(.size15))
                            }
                            VStack {
                                Spacer()
                                HStack(spacing: 0) {
                                    Spacer()
                                    Text("\(detailText.count)")
                                        .defaultStyle_customWeight(size: .size12, weight: .light)
                                    Text("/2000")
                                        .defaultStyle_customWeight(size: .size12, weight: .light)
                                }.padding(5)
                            }
                        }
                    }
                }.padding(.horizontal, 25)
            }
            // MARK: 작성하기 버튼
            Text("작성하기")
                .customStyle_Bold(size: .size22, color: .white)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.subSkyBlue)
                }.padding(.horizontal, 18)
        }.toolbar(.hidden)
    }
    
    struct PayDropDownView: View {
        private let payTypes: [PayType] = PayType.allCases
        @Binding var selectedPayType: PayType
        
        var body: some View {
            VStack(spacing: 20) {
                Picker(selection: $selectedPayType) {
                    ForEach(payTypes, id: \.self) {
                        Text($0.rawValue)
                    }
                } label: {
                    Text("\(selectedPayType.rawValue)")
                }.pickerStyle(MenuPickerStyle())
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.dividerGray, lineWidth: 1)
                    )
                    .tint(.black)
            }
        }
    }
    
    struct TimeDropDownView: View {
        private let times: [String] = generateTimes()
        @Binding var selectedTime: String
        
        var body: some View {
            VStack(spacing: 20) {
                Picker(selection: $selectedTime) {
                    ForEach(times, id: \.self) {
                        Text($0)
                    }
                } label: {
                    Text("\(selectedTime)")
                }.pickerStyle(MenuPickerStyle())
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.dividerGray, lineWidth: 1)
                    )
                    .tint(.black)
            }
        }
        
        static func generateTimes() -> [String] {
            var times: [String] = []
            for hour in 0..<24 {
                for minute in [0, 30] {
                    let timeString = String(format: "%02d:%02d", hour, minute)
                    times.append(timeString)
                }
            }
            times.append("24:00")
            return times
        }
    }
    
    struct ToggleCircleButton: View {
        let text: String
        @Binding var isSelected: Bool
        
        var body: some View {
            Button {
                isSelected.toggle()
            } label: {
                if isSelected {
                    Text("\(text)").defaultStyle_Bold(size: .size18)
                        .padding(10)
                        .background { Circle().fill(Color.dividerGray) }
                } else {
                    Text("\(text)").defaultStyle_Bold(size: .size18)
                        .padding(10)
                        .overlay { Circle().stroke(Color.dividerGray, lineWidth: 1) }
                }
            }

        }
    }
    
    struct ToggleButton: View {
        let text: String
        @Binding var isSelected: Bool
        @Binding var selectedCount: Int
        
        var body: some View {
            Button {
                isSelected.toggle()
                if isSelected {
                    selectedCount += 1
                } else {
                    selectedCount -= 1
                }
            } label: {
                if isSelected {
                    Text("\(text)")
                        .defaultStyle_Bold(size: .size17)
                        .jobToggleBackground(isSelected: isSelected)
                } else {
                    Text("\(text)")
                        .defaultGrayStyle(size: .size17)
                        .jobToggleBackground(isSelected: isSelected)
                }
            }
        }
    }
}
