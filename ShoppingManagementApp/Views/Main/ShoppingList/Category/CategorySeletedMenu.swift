//
//  CategorySeletedMenu.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/02/11.
//

import SwiftUI

struct CategorySeletedMenu: View {
    
    @Environment(\.dismiss) private var dismiss
    var categorys: [ShoppingListCategory]
    @Binding var selectedIndex: Int
    @State var isShowingCategoryAddView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("カテゴリー選択")
                    .font(.title2)
                    .foregroundStyle(.font)
                    .padding()
                
                ScrollView {
                    ForEach(categorys, id: \.self) { category in
                        HStack {
                            Circle()
                                .fill(category.color.themaColor())
                                .frame(width: 24, height: 24)
                            
                            Text(category.name)
                            
                            Spacer()
                            
                            Image(systemName: selectedIndex == categorys.firstIndex(where: { $0 == category }) ? Icon.checkmark.symbolName() : "")
                        }
                        .defaultStyle()
                        .onTapGesture {
                            selectedIndex = categorys.firstIndex(where: { $0 == category }) ?? 0
                            dismiss()
                        }
                    }
                    
                    // 追加ボタン
                    Image(systemName: Icon.add.symbolName())
                        .frame(maxWidth: .infinity)
                        .defaultStyle()
                        .padding()
                        .onTapGesture {
                            print("addddd")
                        }
                }
            }
            
            // 閉じる
            ActionButton(iconName: Icon.close.symbolName()) {
                dismiss()
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .padding()
        .fullScreenBackground(.back)
        .sheet(isPresented: $isShowingCategoryAddView) {
            
        }
    }
}

#Preview {
    @Previewable @State var categorys = ShoppingListViewModel().shoppingList.shoppingListCategorys
    @Previewable @State var index = 0
    CategorySeletedMenu(categorys: categorys,
                        selectedIndex: $index)
        .fullScreenBackground(.back)
}
