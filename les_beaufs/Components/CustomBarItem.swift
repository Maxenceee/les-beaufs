//
//  CustomBarItem.swift
//  les_beaufs
//
//  Created by Maxence Gama on 07/07/2022.
//

import SwiftUI

struct CustomBarItem: View {
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace var namespace
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}

struct CustomBarItem_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .home, .library
    ]
    
    static var previews: some View {
        CustomBarItem(tabs: tabs, selection: .constant(tabs.first!))
    }
}

extension CustomBarItem {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if selection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
}
