//
//  Colors.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/07/15.
//

import SwiftUI

extension Color {
    // MARK: Main Colors
    static let mainSkyBlue = Color(hex: "#A9E9FF")
    static let mainBlue = Color(hex: "#00BFFF")
    
    // MARK: Sub Colors
    static let subSkyBlue = Color(hex: "#87CEFA")
    static let subSkyBlue005 = Color(hex: "#87CEFA").opacity(0.05)
    static let darkBlue = Color(hex: "#6094DA")
    
    // MARK: Gray Colors
    static let black = Color(hex: "#353535")
    static let darkGray = Color(hex: "#666666")
    static let gray = Color(hex: "#999999")
    static let lightGray = Color(hex: "#CCCCCC")
    
    static let shadowGray = Color(.black).opacity(0.25)
    static let dividerGray = Color(hex: "#D9D9D9")
    
    // MARK: Other Colors
    static let lightYellow = Color(hex: "#FFD976")
    static let lightOrange = Color(hex: "#FF722D")
}
 
extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let red = Double((rgb >> 16) & 0xFF) / 255.0
    let green = Double((rgb >>  8) & 0xFF) / 255.0
    let blue = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: red, green: green, blue: blue)
  }
}
