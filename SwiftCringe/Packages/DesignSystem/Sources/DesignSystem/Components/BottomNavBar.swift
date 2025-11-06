//
//  BottomNavBar.swift
//  DesignSystem
//
//  Created by RICHÉ Léo on 06/11/2025.
//

import SwiftUI

public struct BottomNavBar<TabType: Hashable>: View {
    @Binding var selectedTab: TabType
    let tabs: [TabItem<TabType>]

    public init(selectedTab: Binding<TabType>, tabs: [TabItem<TabType>]) {
        self._selectedTab = selectedTab
        self.tabs = tabs
    }

    public var body: some View {
        VStack {
            Spacer()

            HStack {
                ForEach(tabs) { item in
                    Button {
                        withAnimation(.easeInOut) {
                            selectedTab = item.type
                        }
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: item.icon)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(selectedTab == item.type ? .blue : .gray)

                            Text(item.label)
                                .font(.caption)
                                .foregroundColor(selectedTab == item.type ? .blue : .gray)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 14)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 26))
            .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
        }
        .ignoresSafeArea(edges: .bottom)
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

