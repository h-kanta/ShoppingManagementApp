//
//  CustomDropDown.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/02/11.
//

import SwiftUI

struct CustomDropdown<T>: View {
    let list: [T]
    @Binding var selectedIndex: Int
    var isCategoryMenu: Bool = false
    @State var isShowingCategoryMenuView: Bool = false
    @State var isShowingView: Bool = false
    
    var body: some View {
        Button {
            if isCategoryMenu {
                isShowingCategoryMenuView = true
            } else {
                isShowingView = true
            }
        } label: {
            HStack {
                if isCategoryMenu {
                    if let category = list[selectedIndex] as? ShoppingListCategory {
                        Circle()
                            .fill(category.color.themaColor())
                            .frame(width: 24, height: 24)
                        
                        Text(category.name)
                    }
                } else {
                    Text(list[selectedIndex] as? String ?? "")
                }
                
                Spacer()
                
                Image(systemName: Icon.dropdown.symbolName())
            }
            .font(.title3)
            .foregroundStyle(.font)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 2, y: 2) // 薄い影
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: -2, y: -2) // さらに薄い影
            .padding()
            .background(.card)
            .cornerRadius(10)
        }
        // カテゴリメニュー選択
        .sheet(isPresented: $isShowingCategoryMenuView) {
            if let categoryList = list as? [ShoppingListCategory] {
                    CategorySeletedMenu(categorys: categoryList,
                                        selectedIndex: $selectedIndex)
                        .presentationDetents([.large, .large])
                        .presentationDragIndicator(.visible)
            }
        }
        // メニュー選択
        .sheet(isPresented: $isShowingCategoryMenuView) {
            
        }
    }
}

#Preview {
    @Previewable @State var selected = "a"
    @Previewable @State var index = 0
    CustomDropdown(list: ["a","b"], selectedIndex: $index)
        .fullScreenBackground(.back)
}
