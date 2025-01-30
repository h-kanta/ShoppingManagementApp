//
//  ContentView.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/05.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewModel: ShoppingListViewModel = ShoppingListViewModel()
    @State var currentTabBar: Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
        // TabBarAppearanceの設定
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        // 背景色
//        appearance.backgroundColor = UIColor(named: "BackColor")
        // 下線（シャドウ）を透明にする
        appearance.shadowColor = .clear
        // 影をつける
        //appearance.shadowColor = UIColor.black.withAlphaComponent(0.5)
        
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $currentTabBar) {
                HomeView()
                    .fullScreenBackground(.back)
                    .tag(Tab.home)
                ShoppingListView(viewModel: $viewModel)
                    .fullScreenBackground(.back)
                    .tag(Tab.shoppingList)
                InventoryListView()
                    .fullScreenBackground(.back)
                    .tag(Tab.inventoryList)
                ExpenseManagementView()
                    .fullScreenBackground(.back)
                    .tag(Tab.expenseManagement)
                OptionView()
                    .fullScreenBackground(.back)
                    .tag(Tab.option)
            }
            
            CustomTabBar(currentTab: $currentTabBar)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 34)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
