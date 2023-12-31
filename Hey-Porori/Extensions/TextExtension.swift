//
//  TextExtension.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/23.
//

import SwiftUI

enum TextSize: CGFloat {
    case size12 = 12
    case size13 = 13
    case size14 = 14
    case size15 = 15
    case size16 = 16
    case size17 = 17
    case size18 = 18
    case size19 = 19
    case size20 = 20
    case size21 = 21
    case size22 = 22
    case size23 = 23
    case size24 = 24
    case size25 = 25
    case size26 = 26
    case size27 = 27
}

// MARK: Default Style (Black)
extension Text {
    func defaultStyle(size: TextSize = .size13) -> some View {
        self.foregroundColor(.black)
            .font(.system(size: size.rawValue))
    }
    
    func defaultStyle_Bold(size: TextSize = .size13) -> some View {
        self.foregroundColor(.black)
            .font(.system(size: size.rawValue, weight: .bold))
    }
    
    func defaultStyle_customWeight(size: TextSize = .size13, weight: Font.Weight = .regular) -> some View {
        self.foregroundColor(.black)
            .font(.system(size: size.rawValue, weight: weight))
    }
}

// MARK: Default Style (Gray)
extension Text {
    func defaultGrayStyle(size: TextSize = .size13) -> some View {
        self.foregroundColor(.darkGray)
            .font(.system(size: size.rawValue))
    }
    
    func defaultGrayStyle_Bold(size: TextSize = .size13) -> some View {
        self.foregroundColor(.darkGray)
            .font(.system(size: size.rawValue, weight: .bold))
    }
    
    func defaultGrayStyle_customWeight(size: TextSize = .size13, weight: Font.Weight = .regular) -> some View {
        self.foregroundColor(.darkGray)
            .font(.system(size: size.rawValue, weight: weight))
    }
}

// MARK: Custom Color
extension Text {
    func customStyle(size: TextSize = .size13, color: Color) -> some View {
        self.foregroundColor(color)
            .font(.system(size: size.rawValue))
    }
    
    func customStyle_Bold(size: TextSize = .size13, color: Color) -> some View {
        self.foregroundColor(color)
            .font(.system(size: size.rawValue, weight: .bold))
    }
    
    func customStyle(size: TextSize = .size13, color: Color, weight: Font.Weight = .regular) -> some View {
        self.foregroundColor(color)
            .font(.system(size: size.rawValue, weight: weight))
    }
}

extension Font {
    init(_ textSize: TextSize, weight: Font.Weight = .regular, design: Font.Design = .default) {
        self = .system(size: CGFloat(textSize.rawValue), weight: weight, design: design)
    }
}
