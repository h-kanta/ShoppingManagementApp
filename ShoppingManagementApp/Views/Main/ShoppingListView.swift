//
//  ShoppingListView.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/06.
//

import SwiftUI

struct ShoppingListView: View {
    
    @Binding var viewModel: ShoppingListViewModel
    @State var currentTabId: String = "1"
    
    var body: some View {
        VStack {
            Text("買い物リスト")
                .font(.title2)
            
            // MARK: カテゴリタブ
            CategoryTab(categorys: $viewModel.shoppingList.shoppingListCategorys,
                        currentTabId: $currentTabId)
                .padding(.bottom)
            
            // MARK: リストアイテム
            listItems
            

            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    @Previewable @State var shoppingList = ShoppingListViewModel()
    let currentTabId = "1"
    ShoppingListView(viewModel: $shoppingList, currentTabId: currentTabId)
        .fullScreenBackground(.back)
}

// MARK: -UI
extension ShoppingListView {
    
    // MARK: リストアイテム
    private var listItems: some View {
        VStack {
            // 日付ごとにグループ化
            let groupedItems = viewModel.groupByDate(listItems: viewModel.shoppingList.shoppingListItems, currentTabId: currentTabId)
            
            ScrollView {
                // 日付ループ
                ForEach(groupedItems.keys.sorted(), id: \.self) { key in
                    
                    VStack(alignment: .leading) {
                        // 今日日付の場合は「今日」に変換
                        let date = Calendar.current.isDate(key.toDate()!, inSameDayAs: Date()) ? "今日" : key
                        
                        // 日付表示
                        Text(date)
                            .font(.callout)
                            .foregroundStyle(.gray)
                        
                        let items = groupedItems[key] ?? []
                        
                        // 名前ループ
                        ForEach(items, id: \.id) { item in
                            ShoppingListItemView(viewModel: $viewModel,
                                                 item: item,
                                                 currentTabId: $currentTabId)
                        }
                    }
                    .padding(.bottom, 32)
                }
            }
        }
    }
}
