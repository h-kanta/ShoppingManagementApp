//
//  Extensions.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/06.
//

import SwiftUI

// MARK: View 拡張
extension View {
    func fullScreenBackground(_ color: Color) -> some View {
        self.modifier(FullScreenBackground(color: color))
    }
}

// MARK: Date 拡張
extension Date {
    // 指定されたフォーマットで String に変換
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = .current
        return formatter.string(from: self)
    }
}

// MARK: String 拡張
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

// MARK: View 拡張
extension View {
    // デフォルトデザイン
    func defaultStyle() -> some View {
        self
            .font(.title3)
            .foregroundStyle(.font)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 2, y: 2) // 薄い影
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: -2, y: -2) // さらに薄い影
            .padding()
            .background(.card)
            .cornerRadius(10)
    }
}

// MARK: TextField 拡張
extension TextField {
    //  デフォルトのテキストフィールドのデザイン
    func defaultTextFieldStyle(isNumberPad: Bool) -> some View {
        self
            .textInputAutocapitalization(.never) // 頭文字が大文字にならないようにする
            .font(.title3)
            .foregroundStyle(.font)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 2, y: 2) // 薄い影
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: -2, y: -2) // さらに薄い影
            .padding()
            .background(.card)
            .cornerRadius(10)
            .keyboardType(isNumberPad ? .numberPad : .default)
    }
}

// MARK: Picker 拡張
extension Picker {
    // デフォルトのピッカーのデザイン
    func defaultPickerStyle() -> some View {
        self
            .pickerStyle(.menu)
            .tint(.font)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 2, y: 2) // 薄い影
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: -2, y: -2) // さらに薄い影
            .padding()
            .background(.card)
            .cornerRadius(10)
            
    }
}
