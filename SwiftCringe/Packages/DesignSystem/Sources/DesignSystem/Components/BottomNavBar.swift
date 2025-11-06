//
//  BottomNavBar.swift
//  DesignSystem
//
//  Created by RICHÉ Léo on 06/11/2025.
//

import SwiftUI

public struct BottomNavBar<TabType: Hashable, Content: View>: View {
    @Binding var selectedTab: TabType
    let tabs: [TabItem<TabType>]
    let content: (TabType) -> Content

    public init(
        selectedTab: Binding<TabType>,
        tabs: [TabItem<TabType>],
        @ViewBuilder content: @escaping (TabType) -> Content
    ) {
        self._selectedTab = selectedTab
        self.tabs = tabs
        self.content = content
    }

    public var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(tabs) { item in
                content(item.type)
                    .tabItem {
                        Label(item.label, systemImage: item.icon)
                    }
                    .tag(item.type)
            }
        }
        .tint(.blue)
    }
}

public struct TabItem<TabType: Hashable>: Identifiable, Equatable {
    public let id = UUID()
    public let icon: String
    public let label: String
    public let type: TabType

    public init(icon: String, label: String, type: TabType) {
        self.icon = icon
        self.label = label
        self.type = type
    }

    public static func == (lhs: TabItem<TabType>, rhs: TabItem<TabType>) -> Bool {
        lhs.id == rhs.id
    }
}
