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

