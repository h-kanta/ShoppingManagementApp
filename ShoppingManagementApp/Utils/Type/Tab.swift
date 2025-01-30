//
//  Tab.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/07.
//

import SwiftUI

// MARK: カスタムタブバー
enum Tab: CaseIterable {
    case home
    case shoppingList
    case inventoryList
    case expenseManagement
    case option
}

extension Tab {
    // MARK: タブバー名
    func tabName() -> String {
        switch self {
        case .home:
            return "ホーム"
        case .shoppingList:
            return "買い物リスト"
        case .inventoryList:
            return "在庫管理"
        case .expenseManagement:
            return "支出管理"
        case .option:
            return "オプション"
        }
    }
    
    // MARK: タブバーアイコン
    func tabIconName() -> String {
        switch self {
        case .home:
            return "house"
        case .shoppingList:
            return "list.bullet"
        case .inventoryList:
            return "archivebox"
        case .expenseManagement:
            return "yensign.circle"
        case .option:
            return "gearshape"
        }
    }
    
    // MARK: 選択中のタブバーアイコン
    func tabCurrentIconName() -> String {
        switch self {
        case .home:
            return "house.fill"
        case .shoppingList:
            return "list.bullet.circle.fill"
        case .inventoryList:
            return "archivebox.fill"
        case .expenseManagement:
            return "yensign.circle.fill"
        case .option:
            return "gearshape.fill"
        }
    }
}
