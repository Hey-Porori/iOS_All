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
