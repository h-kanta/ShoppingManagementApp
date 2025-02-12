//
//  CustomTabBar.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/07.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab: Tab
    
    var body: some View {
        HStack() {
            ForEach (Tab.allCases, id: \.hashValue) { tab in
                VStack(spacing: 7) {
                    Image(systemName: currentTab == tab ? tab.tabCurrentIconName() : tab.tabIconName())
                        .foregroundStyle(.font)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .frame(height: 32)
                        .scaleEffect(currentTab == tab ? 1.3 : 1.0)
                    
                    Text(tab.tabName())
                        .foregroundStyle(.font)
                        .font(.caption2)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.smooth) {
                        currentTab = tab
                    }
                }
            }
        }
        .frame(height: 40)
        .frame(maxWidth: 360)
        .padding()
        .background {
            Capsule()
                .foregroundStyle(.card)
                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 3, y: 3) // 薄い影
                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: -3, y: -3) // さらに薄い影
        }
        .padding(.horizontal)
    }
}

#Preview {
    @Previewable @State var tab: Tab = .home
    CustomTabBar(currentTab: $tab)
        .fullScreenBackground(.back)
}
