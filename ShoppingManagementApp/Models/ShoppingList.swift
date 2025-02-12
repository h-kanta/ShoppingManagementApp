//
//  ShoppingList.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/06.
//

import Foundation

struct ShoppingList: Identifiable, Hashable {
    let id: String
    let ownerId: String // 作成者ID
    let groupId: String // 共有されるグループID
    var shoppingListCategorys: [ShoppingListCategory]
    var shoppingListItems: [ShoppingListItem]
}

extension ShoppingList {
    // サンプルデータ
    static let MOCK_SHOPPING_LIST = ShoppingList(
        id: "1",
        ownerId: "2",
        groupId: "3",
        shoppingListCategorys: [
            ShoppingListCategory(id: "1", name: "食材", color: .mint, createdAt: Date.now),
            ShoppingListCategory(id: "2", name: "日用品", color: .orange, createdAt: Date.now),
            ShoppingListCategory(id: "3", name: "衣類", color: .pink, createdAt: Date.now),
            ShoppingListCategory(id: "4", name: "Apple", color: .purple, createdAt: Date.now)
        ],
        shoppingListItems: [
            ShoppingListItem(id: "1", categoryId: "1", name: "卵", quantity: 6, unit: "個", expectedDate: Date(), isChecked: false, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "2", categoryId: "1", name: "食パン", quantity: 5, unit: "つ", expectedDate: "2025/2/10".toDate()!, isChecked: true, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "3", categoryId: "1", name: "お肉", quantity: 2, unit: "パック", expectedDate: Date(), isChecked: false, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "4", categoryId: "1", name: "牛乳", quantity: 1, unit: "本", expectedDate: Date(), isChecked: false, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "5", categoryId: "1", name: "醤油", quantity: 1, unit: "本", expectedDate: "2025/2/10".toDate()!, isChecked: true, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "6", categoryId: "1", name: "はちみつ", quantity: 2, unit: "つ", expectedDate: Date(), isChecked: false, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "7", categoryId: "1", name: "冷凍食品", quantity: 2, unit: "つ", expectedDate: Date(), isChecked: false, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "8", categoryId: "1", name: "レタス", quantity: 1, unit: "束", expectedDate: "2025/2/10".toDate()!, isChecked: true, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "9", categoryId: "1", name: "きゅうり", quantity: 100, unit: "本", expectedDate: Date(), isChecked: false, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "1", categoryId: "2", name: "柔軟剤", quantity: 2, unit: "つ", expectedDate: Date(), isChecked: false, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "2", categoryId: "2", name: "洗剤", quantity: 1, unit: "つ", expectedDate: Date(), isChecked: true, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "3", categoryId: "2", name: "トイレットペーパー", quantity: 1, unit: "つ", expectedDate: Date.now, isChecked: true, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "1", categoryId: "3", name: "くつした", quantity: 3, unit: "足", expectedDate: Date(), isChecked: false, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "2", categoryId: "3", name: "パンツ", quantity: 2, unit: "着", expectedDate: Date(), isChecked: true, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "1", categoryId: "4", name: "MackBook Air", quantity: 1, unit: "つ", expectedDate: Date(), isChecked: false, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "2", categoryId: "4", name: "iPad mini", quantity: 1, unit: "つ", expectedDate: Date(), isChecked: true, createdAt: Date(), updatedAt: Date()),
            ShoppingListItem(id: "3", categoryId: "4", name: "iPhone15 pro max", quantity: 1, unit: "つ", expectedDate: Date(), isChecked: true, createdAt: Date(), updatedAt: Date()),
        ])
}
