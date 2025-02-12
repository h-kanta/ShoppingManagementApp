//
//  Icon.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/18.
//

import SwiftUI

// MARK: アイコン
enum Icon: CaseIterable {
//    // ホーム
//    case home
//    // 買い物リスト
//    case shoppingList
//    // 在庫管理
//    case inventoryList
//    // 支出管理
//    case expenseManagement
//    // オプション
//    case option
    // チェックマーク
    case checkmark
    // チェック未
    case check
    //　チェック済
    case checked
    // ゴミ箱
    case trash
    // 編集
    case edit
    // 追加
    case add
    // 閉じる
    case close
    // ドロップダウンの印
    case dropdown
}

extension Icon {
    func symbolName() -> String {
        switch self {
//        case .home:
//            return Image(systemName: "house")
//        case .shoppingList:
//            return Image(systemName: "list.bullet")
//        case .inventoryList:
//            return Image(systemName: "door.french.closed")
//        case .expenseManagement:
//            return Image(systemName: "yensign.circle")
//        case .option:
//            return Image(systemName: "gearshape")
        case .checkmark:
            return "checkmark"
        case .check:
            return "square"
        case .checked:
            return "checkmark.square.fill"
        case .trash:
            return "trash.fill"
        case .edit:
            return "pencil"
        case .add:
            return "plus"
        case .close:
            return "multiply"
        case .dropdown:
            return "chevron.down"
        }
    }
}
