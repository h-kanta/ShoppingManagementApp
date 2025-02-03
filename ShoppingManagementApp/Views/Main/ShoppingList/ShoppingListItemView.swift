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
//            // 編集
            Action(tint: .orange, icon: Icon.edit.symbolName()) {
                print("Edit")
            }
            // 削除
            Action(tint: .red, icon: Icon.trash.symbolName()) {
                withAnimation(.easeInOut) {
                    viewModel.deleteListItem(categoryId: currentTabId, listItemId: item.id)
                }
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
    var cornerRadius: CGFloat = 0 // 角丸
    var direction: SwipeDirection = .trailing // スワイプの方向
    @ViewBuilder var content: Content // スワイプ可能なアイテムのビュー
    @ActionBuilder var actions: [Action] // スワイプした時に表示されるアクションボタン
    let viewId = UUID()
    @State private var isEnabled: Bool = true // スワイプ動作が可能かどうか
    @State private var scrollOffset: CGFloat = .zero // スワイプ距離
    
    var body: some View {
        ScrollViewReader { scrollProxy in // スワイプ位置を制御
            ScrollView(.horizontal) { // 横スワイプを可能にする
                LazyHStack(spacing: 0) { // アクションボタンを横並びに
                    content
                        .containerRelativeFrame(.horizontal) // アイテムの幅を親のサイズに合わせる
                        .id(viewId)
                        .transition(.identity)
                        .overlay {
                            GeometryReader {
                                let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                                
                                Color.clear
                                    .preference(key: OffsetKey.self, value: minX)
                                    .onPreferenceChange(OffsetKey.self) {
                                        scrollOffset = $0
                                    }
                            }
                        }
                    
                    ActionButton {
                        withAnimation {
                            scrollProxy.scrollTo(viewId, anchor: direction == .trailing ?
                                .topLeading : .topTrailing)
                        }
                    }
                }
                .scrollTargetLayout()
                .visualEffect { content, geometryProxy in
                    content
                        .offset(x: scrollOffset(geometryProxy)) // 左から右スワイプの制御
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned) // スワイプ後にボタンがちょうど表示されるように調整
            .background {
                if let lastAction = actions.last {
                    Rectangle()
                        .fill(lastAction.tint)
                        .opacity(scrollOffset == .zero ? 0 : 1)
                }
            }
            .clipShape(.rect(cornerRadius: cornerRadius))
        }
        .allowsHitTesting(isEnabled)
        .transition(CustomTransition()) // 削除時のアニメーション
    }
    
    // MARK: アクションボタン
    @ViewBuilder
    func ActionButton(resetPosition: @escaping () -> ()) -> some View {
        Rectangle()
            .fill(.clear)
            .frame(width: CGFloat(actions.count) * 80)
            .overlay(alignment: direction.alignment) {
                HStack(spacing: 0) {
                    ForEach(actions) { button in
                        Button {
                            Task {
                                isEnabled = false
                                resetPosition()
                                try? await Task.sleep(for: .seconds(0.25)) // 0.25後にボタンアクションを開始する
                                button.action()
                                try? await Task.sleep(for: .seconds(0.1))
                                isEnabled = true
                            }
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
    
    // 左から右スワイプの制御
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        
        return direction == .trailing ? (minX > 0 ? -minX : 0) : (minX < 0 ? -minX : 0)
    }
}


struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct CustomTransition: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .mask {
                GeometryReader {
                    let size = $0.size
                    
                    Rectangle()
                        .offset(y: phase == .identity ? 0 : -size.height)
                }
                .containerRelativeFrame(.horizontal)
                
            }
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
