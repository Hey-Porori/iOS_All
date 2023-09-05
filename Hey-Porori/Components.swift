//
//  Components.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/08/05.
//

import SwiftUI

struct SearchTextBox: View {
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
