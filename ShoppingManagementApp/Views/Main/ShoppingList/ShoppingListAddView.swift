//
//  ShoppingListAddView.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/02/02.
//

import SwiftUI

struct ShoppingListAddView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            HStack {
                ActionButton(iconName: Icon.close.symbolName()) {
                    dismiss()
                }
                
                Spacer()
                
                ActionButton(iconName: Icon.decision.symbolName()) {
                    
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ShoppingListAddView()
        .fullScreenBackground(.back)
}

