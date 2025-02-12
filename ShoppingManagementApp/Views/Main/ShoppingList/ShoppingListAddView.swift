//
//  ShoppingListAddView.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/02/02.
//

import SwiftUI

struct ShoppingListAddView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var viewModel: ShoppingListViewModel
    
    @State var text: String = ""
    @State var quantity: String = ""
    
    var unit: [String] = ["つ", "枚", "個", "機", "パック", "着", "足"]
    @State var unitSelection: Int = 0
    @State var categorySelectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                // 購入するもの
                InputField(text: $text, placeholder: "購入するもの")
                
                HStack {
                    // 数量
                    InputField(text: $quantity, placeholder: "数量", isNumberPadField: true)
                    // 単位
                    CustomDropdown(list: unit,
                                   selectedIndex: $unitSelection)
                }
                
                // カテゴリ
                CustomDropdown(list: viewModel.shoppingList.shoppingListCategorys,
                               selectedIndex: $categorySelectedIndex,
                               isCategoryMenu: true)
            }
            
            HStack {
                ActionButton(iconName: Icon.close.symbolName()) {
                    dismiss()
                }
                
                Spacer()
                
                ActionButton(iconName: Icon.checkmark.symbolName()) {
                    
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding()
        }
        .padding(.horizontal)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    @Previewable @State var shoppingList = ShoppingListViewModel()
    ShoppingListAddView(viewModel: $shoppingList)
        .fullScreenBackground(.back)
}

// MARK: --UI
extension ShoppingListAddView {
    
}


struct CustomDropdownSample: View {
    @State private var isExpanded = false
    @State private var selectedItem: String = "選択してください"
    
    let items = ["食材", "日用品", "衣類", "家電"]
    
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(selectedItem)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .animation(.easeInOut(duration: 0.2), value: isExpanded)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 1, y: 2)
            }
            
            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        Button(action: {
                            selectedItem = item
                            isExpanded = false
                        }) {
                            HStack {
                                Text(item)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding()
                            .background(Color.white)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 1, y: 2)
            }
        }
        .padding()
    }
}
