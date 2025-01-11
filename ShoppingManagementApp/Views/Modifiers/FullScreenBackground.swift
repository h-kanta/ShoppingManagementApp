//
//  FullScreenBackground.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/06.
//

import SwiftUI

struct FullScreenBackground: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)
            content
        }
    }
}
