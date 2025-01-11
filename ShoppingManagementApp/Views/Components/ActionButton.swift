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
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .foregroundStyle(.main)
                
                Image(systemName: iconName)
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .frame(width: 80, height: 80)
        }
    }
}

#Preview {
    ActionButton(iconName: "checkmark") {
        print("ボタンがタップされました")
    }
}
