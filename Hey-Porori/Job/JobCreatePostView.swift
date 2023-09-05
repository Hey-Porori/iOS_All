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
    @State private var days: [SelectBlock] = dayList.map { SelectBlock(text: $0) }
    @State private var startTime = "09:00"
    @State private var endTime = "18:00"
    @State private var payType: PayType = .시급
    
    @State private var detailText = ""
    @State private var payText = ""

    var body: some View {
        VStack {
            DefaultHeaderView(headerText: "알바공고 쓰기", isViewPresented: $isPresentJobCreatePostView)
            ScrollView {
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
                            HStack(spacing: 0) {
                                Text("\(workTypeSelectedCount)")
                                    .foregroundColor(.lightOrange)
                                Text("/\(workTypes.count)")
                            }
                        }.padding(.leading, 3)
                        
                        HFlow(spacing: 8) {
                            ForEach(0..<workTypes.count, id: \.self) { index in
                                ToggleButton(text: self.workTypes[index].text, isSelected: self.$workTypes[index].isSelected, selectedCount: $workTypeSelectedCount)
                            }
                        }
                    }.padding(.bottom, 25)
                    
                    // MARK: 근무 기간
                    VStack(alignment: .leading) {
                        HStack {
                            Text("근무 기간").defaultStyle_Bold(size: .size16)
                            Spacer()
                            HStack(spacing: 0) {
                                Text("\(workTimeSelectedCount)")
                                    .foregroundColor(.lightOrange)
                                Text("/\(workTimes.count)")
                            }
                        }.padding(.leading, 3)
                        
                        HFlow(spacing: 8) {
                            ForEach(0..<workTimes.count, id: \.self) { index in
                                ToggleButton(text: self.workTimes[index].text, isSelected: self.$workTimes[index].isSelected, selectedCount: $workTimeSelectedCount)
                            }
                        }
                    }.padding(.bottom, 25)
                    
                    // MARK: 근무 요일
                    VStack(alignment: .leading) {
                        HStack {
                            Text("근무 요일").defaultStyle_Bold(size: .size16)
                            Spacer()
                        }.padding(.leading, 3)
                        HFlow {
                            ForEach(0..<days.count, id: \.self) { index in
                                ToggleCircleButton(text: self.days[index].text, isSelected: self.$days[index].isSelected)
                            }
                        }
                    }.padding(.bottom, 25)
                    
                    // MARK: 근무 시간
                    VStack(alignment: .leading) {
                        HStack {
                            Text("근무 시간").defaultStyle_Bold(size: .size16)
                            Spacer()
                        }.padding(.leading, 3)
                        HStack {
                            TimeDropDownView(selectedTime: $startTime)
                            Text("~").defaultStyle_Bold(size: .size18)
                            TimeDropDownView(selectedTime: $endTime)
                        }
                    }.padding(.bottom, 25)
                    
                    // MARK: 급여
                    VStack(alignment: .leading) {
                        HStack {
                            Text("급여").defaultStyle_Bold(size: .size16)
                            Spacer()
                        }.padding(.leading, 3)
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
                    }.padding(.bottom, 25)
                    
                    // MARK: 상세 내용
                    ZStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("상세 내용").defaultStyle_Bold(size: .size16)
                                Spacer()
                            }.padding(.leading, 3)
                            HStack {
                                TextEditor(text: $detailText)
                                    .jobCustomBackGround()
                                    .font(Font(.size15))
                            }
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
                    }.padding(.bottom, 25)
                }.padding(.horizontal, 25)
            }
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
