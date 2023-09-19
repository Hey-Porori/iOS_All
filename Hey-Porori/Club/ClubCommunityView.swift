//
//  ClubCommunityView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/19.
//

import SwiftUI

struct ClubCommunityView: View {
    let clubData: ClubData
    
    var body: some View {
        VStack {
            RightButtonHeaderViewWithArray(headerText: clubData.clubName) {
                Button {
                    // TODO: Club Exit
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .defaultHeaderIcon()
                }
            }
        }
    }
}
