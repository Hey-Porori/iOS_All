//
//  Components.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/08/05.
//

import SwiftUI

struct CommunitySearchTextBox: View {
    let placeholder: String
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $searchText)
                .font(.system(size: TextSize.size14.rawValue))
                .padding(.leading, 10)
                .padding(.vertical, 8)
            Image(systemName: "magnifyingglass")
                .foregroundColor(.lightGray)
                .font(.system(size: TextSize.size24.rawValue))
                .padding(5)
        }.background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .defaultShadow()
        }
    }
}

struct DefaultSearchTextBox: View {
    let placeholder: String
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $searchText)
                .font(Font(.size14))
                .padding(.leading, 10)
                .padding(.vertical, 8)
            Image(systemName: "magnifyingglass")
                .foregroundColor(.lightGray)
                .font(.system(size: TextSize.size24.rawValue))
                .padding(5)
        }.background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.searchBarGray)
        }
    }
}


/// return the Default Header. It have Title of Header and back button(x)
///
/// - Parameters:
///   - headerText: Title text of Header
///   - isViewPresented: Boolean variable control the appearance of view.
/// - Returns: Header View with Title and Back button.
struct DefaultHeaderView: View {
    let headerText: String
    @Binding var isViewPresented: Bool
    
    var body: some View {
        HStack {
            ZStack {
                Text(headerText).foregroundColor(.darkGray)
                    .font(.system(size: 19, weight: .bold))
                HStack {
                    Button {
                        isViewPresented = false
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.darkGray)
                    }
                    Spacer()
                }
            }
        }.padding(.horizontal, 13).padding(.top, 5)
    }
}

/// return the Header with Right Button.
///
/// - Parameters:
///   - headerText: Title text of Header
///   - isViewPresented: Boolean variable control the appearance of view.
///   - rightComponent: View, on the right side of Header
/// - Returns: Header View with right component that you input.
func rightButtonHeaderView(headerText: String, isViewPresented: Binding<Bool>, rightComponent: some View) -> some View {
    return HStack {
        ZStack {
            Text(headerText).foregroundColor(.darkGray)
                .font(.system(size: 19, weight: .bold))
            HStack {
                Button {
                    isViewPresented.wrappedValue = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.darkGray)
                }
                Spacer()
                rightComponent
            }
        }
    }.padding(.horizontal, 13).padding(.top, 5)
}

/// NavigationLink & NaviagtionDestination을 이용한 여러 네비게이팅을 한 번에 생성했을 때, 안쪽 view에서 사용.
///
/// - Parameters:
///   - headerText: Title text of Header
/// - Returns: Header View with Title and Back button.
struct DefaultHeaderViewWithArray: View {
    let headerText: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            ZStack {
                Text(headerText).foregroundColor(.darkGray)
                    .font(.system(size: 19, weight: .bold))
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.darkGray)
                    }
                    Spacer()
                }
            }
        }.padding(.horizontal, 13).padding(.top, 5)
    }
}

/// NavigationLink & NaviagtionDestination을 이용한 여러 네비게이팅을 한 번에 생성했을 때, 안쪽 view에서 사용.
/// 그런데 이제 오른쪽 버튼도 곁들인.
///
/// - Parameters:
///   - headerText: Title text of Header
/// - Returns: Header View with Title and Back button.
struct RightButtonHeaderViewWithArray<RightButtonContent: View>: View {
    let headerText: String
    let rightButtonContent: () -> RightButtonContent
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            ZStack {
                Text(headerText).foregroundColor(.darkGray)
                    .font(.system(size: 19, weight: .bold))
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.darkGray)
                    }
                    Spacer()
                    rightButtonContent()
                }
            }
        }.padding(.horizontal, 13).padding(.top, 5)
    }
}


/// 아르바이트(Job) 페이지에서,
/// 알바공고 쓰기 (JobCreatePostView)와, 검색조건 설정(JobPostFilterView)에서 쓰이는 기본 View Section입니다.
struct JobPostSection<BottomComponent: View>: View {
    let title: String
    let bottomComponent: BottomComponent
    
    init(title: String, @ViewBuilder bottomComponent: () -> BottomComponent) {
        self.title = title
        self.bottomComponent = bottomComponent()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(title)").defaultStyle_Bold(size: .size16)
            }.padding(.leading, 3)
            
            bottomComponent
        }.padding(.bottom, 25)
    }
}

/// 아르바이트(Job) 페이지에서,
/// 알바공고 쓰기 (JobCreatePostView)와, 검색조건 설정(JobPostFilterView)에서 쓰이는 기본 View Section입니다.
/// Title Row의 우측에 다른 View를 추가할 때의 버전입니다.
struct JobPostSection_Right<BottomComponent: View, RightComponent: View>: View {
    let title: String
    let rightComponent: RightComponent
    let bottomComponent: BottomComponent
    
    init(title: String, @ViewBuilder rightComponent: () -> RightComponent, @ViewBuilder bottomComponent: () -> BottomComponent) {
        self.title = title
        self.rightComponent = rightComponent()
        self.bottomComponent = bottomComponent()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(title)").defaultStyle_Bold(size: .size16)
                Spacer()
                rightComponent
            }.padding(.leading, 3)
            
            bottomComponent
        }.padding(.bottom, 25)
    }
}

/// 아르바이트(Job) 페이지에서,
/// 알바공고 쓰기 (JobCreatePostView)와, 검색조건 설정(JobPostFilterView)에서 쓰이는 둥근 직사각형 버튼입니다.
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

/// 아르바이트(Job) 페이지에서,
/// 알바공고 쓰기 (JobCreatePostView)와, 검색조건 설정(JobPostFilterView)에서
/// 요일 선택 시 쓰이는 둥근 버튼입니다.
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

/// 아르바이트(Job) 페이지에서,
/// 알바공고 쓰기 (JobCreatePostView)와, 검색조건 설정(JobPostFilterView)에서
/// 근무 시간 선택 시 쓰이는 DropdownButton입니다.
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
