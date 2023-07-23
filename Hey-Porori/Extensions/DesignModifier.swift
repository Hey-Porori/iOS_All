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
    
    func defaultBackground() -> some View {
        self.padding(.horizontal, 17)
            .padding(.vertical, 20)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .defaultShadow()
            }
    }
}

extension TextField {
    func defaultBackground() -> some View {
        self.padding(.horizontal, 17)
            .padding(.vertical, 20)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .defaultShadow()
            }
    }
    
    func customBackground(HPad: CGFloat = 17, VPad: CGFloat = 20, minHeight: CGFloat = 100) -> some View {
        self.padding(.horizontal, HPad)
            .padding(.vertical, VPad)
            .frame(minHeight: minHeight)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .defaultShadow()
            }
    }
}

extension TextEditor {
    func defaultBackground() -> some View {
        self.padding(.horizontal, 17)
            .padding(.vertical, 20)
            .frame(maxHeight: 250)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .defaultShadow()
            }
    }
    
    func customBackground(HPad: CGFloat = 17, VPad: CGFloat = 20, maxHeight: CGFloat = 250) -> some View {
        self.padding(.horizontal, HPad)
            .padding(.vertical, VPad)
            .frame(maxHeight: maxHeight)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .defaultShadow()
            }
    }
}

