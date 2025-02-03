//
//  ShoppingListViewModel.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/12.
//

import SwiftUI

struct ShoppingListViewModel {
    
    var shoppingList: ShoppingList
    
    init() {
        shoppingList = ShoppingList.MOCK_SHOPPING_LIST
    }
    
    // MARK: 日付別にグループ分けを行う
    func groupByDate(listItems: [ShoppingListItem], currentTabId: String) -> Dictionary<String, [ShoppingListItem]> {
        return Dictionary(grouping: listItems.filter({$0.categoryId == currentTabId})) { item in
            item.expectedDate.toString()
        }
    }
    
    // MARK: チェックアクション
    mutating func shoppingItemCheckAction(categoryId: String, listItemId: String) {
        if let index = getlistItemIndex(categoryId, listItemId) {
            shoppingList.shoppingListItems[index].isChecked.toggle()
        }
    }
    
    // MARK: カテゴリーのカラーを取得
    func getCategoryColor(categoryId: String) -> Color {
        if let index = shoppingList.shoppingListCategorys.firstIndex(where: { $0.id == categoryId }) {
            return shoppingList.shoppingListCategorys[index].color.themaColor()
        }
        
        return shoppingList.shoppingListCategorys[0].color.themaColor()
    }
    
    // MARK: リスト削除
    mutating func deleteListItem(categoryId: String, listItemId: String) {
        if let index = getlistItemIndex(categoryId, listItemId) {
            shoppingList.shoppingListItems.remove(at: index)
        }
    }
    
    // MARK: 該当するリストアイテムのインデックスを返す
    func getlistItemIndex(_ categoryId: String, _ listItemId: String) -> Int? {
        return shoppingList.shoppingListItems.firstIndex(where: { $0.id == listItemId && $0.categoryId == categoryId })
    }
}
