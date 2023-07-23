//
//  DesignModifier.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/23.
//

import SwiftUI

extension View {
    func defaultShadow() -> some View {
        self.shadow(color: .shadowGray, radius: 2, y: 2)
    }
}
