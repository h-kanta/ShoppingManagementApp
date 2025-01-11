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
