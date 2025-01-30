//
//  Extensions.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/06.
//

import SwiftUI

extension View {
    func fullScreenBackground(_ color: Color) -> some View {
        self.modifier(FullScreenBackground(color: color))
    }
}

extension Date {
    // 指定されたフォーマットで String に変換
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = .current
        return formatter.string(from: self)
    }
}

extension String {
    // 指定されたフォーマットで Date に変換
    func toDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = .current
        formatter.timeZone = .current
        return formatter.date(from: self)
    }
}
