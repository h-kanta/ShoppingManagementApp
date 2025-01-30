//
//  ShoppingListCategory.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/12.
//

import Foundation

struct ShoppingListCategory: Identifiable, Hashable {
    let id: String
    let name: String
    let color: CategoryColor
    let createdAt: Date
}
