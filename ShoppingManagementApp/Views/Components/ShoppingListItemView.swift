//
//  ShoppingListItem.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/26.
//

import SwiftUI

struct ShoppingListItemView: View {
    
    @Binding var viewModel: ShoppingListViewModel
    let item: ShoppingListItem
    @Binding var currentTabId: String
    
    var body: some View {
        SwipeAction(cornerRadius: 10, direction: .trailing) {
            ZStack {
                // 背景色
                Rectangle()
                    .foregroundStyle(.card)
                    .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 2, y: 2) // 薄い影
                    .shadow(color: Color.gray.opacity(0.2), radius: 5, x: -2, y: -2) // さらに薄い影
                
                // リストアイテム
                HStack {
                    // チェックアイコン
                    Image(systemName: item.isChecked ?
                          Icon.checked.symbolName() : Icon.check.symbolName())
                        .foregroundStyle(viewModel.getCategoryColor(categoryId: currentTabId))
                        .font(.title3)
                    
                    HStack {
                        // アイテム名
                        Text(item.name)
                        
                        Spacer()
                        
                        // 数量と単位
                        HStack {
                            Text(item.quantity.description)
                            
                            Text(item.unit)
                        }
                    }
                    .foregroundStyle(item.isChecked ?
                        .font.opacity(0.4) : .font)
                    .overlay {
                        if item.isChecked {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(viewModel.getCategoryColor(categoryId: currentTabId))
                                .offset(y: 0) // テキスト中央に配置
                        }
                    }
                }
                .padding(.horizontal)
                .animation(.spring, value: item.isChecked)
                
            }
            .frame(height: 56)
            .onTapGesture {
                viewModel.shoppingItemCheckAction(categoryId: currentTabId,
                                                  listItemId: item.id)
            }
        } actions: {
            Action(tint: .orange, icon: Icon.edit.symbolName()) {
                print("Edit")
            }
            Action(tint: .red, icon: Icon.trash.symbolName()) {
                print("Delete")
            }
        }
        .padding(.horizontal, 4)
    }
}

#Preview {
    @Previewable @State var shoppingList = ShoppingListViewModel()
    let currentTabId = "1"
    ShoppingListView(viewModel: $shoppingList, currentTabId: currentTabId)
        .fullScreenBackground(.back)
}

// スワイプの方向
enum SwipeDirection {
    case leading
    case trailing
    
    var alignment: Alignment {
        switch self {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}

struct SwipeAction<Content: View>: View {
    var cornerRadius: CGFloat = 0
    var direction: SwipeDirection = .trailing
    @ViewBuilder var content: Content
    @ActionBuilder var actions: [Action]
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    content
                        .containerRelativeFrame(.horizontal)
                    
                    ActionButton()
                }
                .scrollTargetLayout()
                .visualEffect { content, geometryProxy in
                    content
                        .offset(x: scrollOffset(geometryProxy))
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .clipShape(.rect(cornerRadius: cornerRadius))
        }
    }
    
    // Action Button
    @ViewBuilder
    func ActionButton() -> some View {
        Rectangle()
            .fill(.clear)
            .frame(width: CGFloat(actions.count) * 80)
            .overlay(alignment: direction.alignment) {
                HStack(spacing: 0) {
                    ForEach(actions) { button in
                        Button {
                            
                        } label: {
                            Image(systemName: button.icon)
                                .font(button.iconFont)
                                .foregroundStyle(button.iconTint)
                                .frame(width: 80)
                                .frame(maxHeight: .infinity)
                                .contentShape(.rect)
                        }
                        .buttonStyle(.plain)
                        .background(button.tint)
                    }
                }
            }
    }
    
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        
        return direction == .trailing ? (minX > 0 ? -minX : 0) : (minX < 0 ? -minX : 0)
    }
}

struct Action: Identifiable {
    private(set) var id: UUID = .init()
    var tint: Color
    var icon: String
    var iconFont: Font = .title
    var iconTint: Color = .white
    var isEnabled: Bool = true
    var action: () -> ()
}

@resultBuilder
struct ActionBuilder {
    static func buildBlock(_ components: Action...) -> [Action] {
        return components
    }
}
