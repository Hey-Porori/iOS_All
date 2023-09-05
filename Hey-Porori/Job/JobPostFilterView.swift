//
//  JobPostFilterView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/05.
//

import SwiftUI

struct JobPostFilterView: View {
    @Binding var isPresentjobPostFilterView: Bool
    
    var body: some View {
        VStack {
            DefaultHeaderView(headerText: "검색조건 설정", isViewPresented: $isPresentjobPostFilterView)
            ScrollView {
                
            }
            Spacer()
        }.toolbar(.hidden)
    }
}

