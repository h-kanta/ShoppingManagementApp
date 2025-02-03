//
//  ActiveButton.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/05.
//

import SwiftUI

struct ActionButton: View {
    
    let iconName: String
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.card)

            Image(systemName: iconName)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.font)
        }
        .frame(width: 72, height: 72)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 3, y: 3) // 薄い影
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: -3, y: -3) // さらに薄い影
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    ActionButton(iconName: "checkmark") {
        print("ボタンがタップされました")
    }
}
