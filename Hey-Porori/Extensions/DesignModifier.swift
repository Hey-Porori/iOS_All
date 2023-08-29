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
    
    func jobToggleBackground(isSelected: Bool) -> some View {
        self.padding(.vertical, 4)
        .padding(.horizontal, 7)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .inset(by: 0.5)
                .stroke(isSelected ? .black : .dividerGray, lineWidth: 1)
        )
    }
    
    func jobTextFieldCustomBackGround(HPad: CGFloat = 16, VPad: CGFloat = 11, strokeColor: Color = .dividerGray, lineWidth: CGFloat = 2) -> some View {
        self.padding(.horizontal, HPad)
            .padding(.vertical, VPad)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.white)
            ).overlay(
                RoundedRectangle(cornerRadius: 5)
                .inset(by: 1)
                .stroke(strokeColor, lineWidth: lineWidth)
            )
    }
}

extension TextField {
    func defaultBackground_Shadow() -> some View {
        self.padding(.horizontal, 17)
            .padding(.vertical, 20)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .defaultShadow()
            }
    }
    
    func customBackground_Shadow(HPad: CGFloat = 17, VPad: CGFloat = 20, minHeight: CGFloat = 100) -> some View {
        self.padding(.horizontal, HPad)
            .padding(.vertical, VPad)
            .frame(minHeight: minHeight)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .defaultShadow()
            }
    }
    
    func jobDefaultBackGround() -> some View {
        self.padding(.horizontal, 16)
            .padding(.vertical, 11)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.white)
            ).overlay(
                RoundedRectangle(cornerRadius: 5)
                .inset(by: 1)
                .stroke(Color.dividerGray, lineWidth: 2)
            )
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
    
    func jobCustomBackGround(HPad: CGFloat = 10, VPad: CGFloat = 5, minHeight: CGFloat = 150) -> some View {
        self.padding(.horizontal, HPad)
            .padding(.vertical, VPad)
            .frame(minHeight: minHeight)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.white)
            ).overlay(
                RoundedRectangle(cornerRadius: 5)
                .inset(by: 1)
                .stroke(Color.dividerGray, lineWidth: 1)
            )
    }
}
