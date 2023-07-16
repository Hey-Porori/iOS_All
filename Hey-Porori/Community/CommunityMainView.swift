//
//  CommunityMainView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/15.
//

import SwiftUI

enum CommunityViewPage: String, CaseIterable, Identifiable {
    case mapView
    case hotPost
    case myPost
    
    var id: CommunityViewPage { self }
}

struct CommunityMainView: View {
    @State private var pageOption: CommunityViewPage = .mapView
    
    var body: some View {
        VStack {
            Picker(selection: $pageOption, label: Text("")) {
                ForEach(CommunityViewPage.allCases) { option in
                    pickerItemBox(pageOption: option)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .padding(.top, 5)
            .padding(.bottom, 10)
            
            // MARK: pageOption
            switch pageOption {
            case .mapView:
                CommunityMapView()
            case .hotPost:
                Text("인기 게시글")
            case .myPost:
                Text("MY 게시글")
            }
        }
    }
    
    // TODO: Segmented Picker 디자인 커스텀 - 아마 커스텀뷰로 그려야 함.
    private func pickerItemBox(pageOption: CommunityViewPage) -> some View {
        return HStack {
            switch pageOption {
            case .mapView:
                Text("지도에서 보기")
            case .hotPost:
                Text("인기 게시글")
            case .myPost:
                Text("MY 게시글")
            }
        }
    }
}
