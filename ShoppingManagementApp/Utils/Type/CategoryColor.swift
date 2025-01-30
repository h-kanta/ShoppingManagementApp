//
//  CategoryColor.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/26.
//

import SwiftUI

enum CategoryColor: CaseIterable {
    case main
    case orange
    case green
    case pink
    case blue
    case purple
}

extension CategoryColor {
    func themaColor() -> Color {
        switch self {
        case .main:
            return Color("MainColor")
        case .orange:
            return convertRGBToColor(red: 241, green: 202, blue: 140)
        case .green:
            return convertRGBToColor(red: 176, green: 241, blue: 136)
        case .pink:
            return convertRGBToColor(red: 250, green: 173, blue: 188)
        case .blue:
            return convertRGBToColor(red: 174, green: 208, blue: 247)
        case .purple:
            return convertRGBToColor(red: 211, green: 181, blue: 239)
        }
    }
    
    // RGB での 0~255 の値を 0.0 ~ 1.0 に変換する
    func convertRGBToColor(red: Double, green: Double, blue: Double) -> Color {
        Color(red: red/255, green: green/255, blue: blue/255)
    }
}

