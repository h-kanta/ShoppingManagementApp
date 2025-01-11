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
        HStack {
            ForEach (Tab.allCases, id: \.hashValue) { tab in
                VStack(spacing: 7) {
                    Image(systemName: currentTab == tab ? tab.tabCurrentIcon() : tab.tabIcon())
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .frame(height: 32)
                        .scaleEffect(currentTab == tab ? 1.3 : 1.0)
                    
                    Text(tab.tabName())
                        .font(.caption2)
                }
                .contentShape(Rectangle())
                .padding(.bottom, 34)
                .onTapGesture {
                    withAnimation(.smooth) {
                        currentTab = tab
                    }
                }
            }
        }
        .frame(height: 90)
        .padding()
        .frame(maxWidth: 600)
        .background {
            Rectangle()
                .foregroundStyle(.main).opacity(0.1)
        }
    }
}

#Preview {
    @Previewable @State var tab: Tab = .home
    CustomTabBar(currentTab: $tab)
}
