//
//  CategoryTab.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/12.
//

import SwiftUI

struct CategoryTab: View {
    
    @Binding var categorys: [ShoppingListCategory]
    @Binding var currentTabId: String
    @Namespace private var animation // タブエフェクト
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(categorys, id: \.self) { category in
                    Text(category.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(currentTabId == category.id ? .back : category.color.themaColor())
                        .padding(10)
                        .background {
                            if currentTabId == category.id {
                                Rectangle()
                                    .cornerRadius(10)
                                    .foregroundStyle(category.color.themaColor())
                                    .matchedGeometryEffect(id: "SHOPPINGLISTTAB", in: animation)
                            } else {
                                Capsule()
                                    .stroke(category.color.themaColor())
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring) {
                                currentTabId = category.id
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currentTabId: String = "1"
    @Previewable @State var categorys: [ShoppingListCategory] = ShoppingList.MOCK_SHOPPING_LIST.shoppingListCategorys
    CategoryTab(categorys: $categorys, currentTabId: $currentTabId)
}
