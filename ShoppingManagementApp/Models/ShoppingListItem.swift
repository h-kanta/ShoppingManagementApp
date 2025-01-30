//
//  ShoppingListItem.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/11.
//

import Foundation

struct ShoppingListItem: Identifiable, Hashable {
    var id: String
    var categoryId: String
    var name: String
    var quantity: Int
    var unit: String
    var expectedDate: Date
    var isChecked: Bool // 購入済みかどうか
    var createdAt: Date
    var updatedAt: Date
}
