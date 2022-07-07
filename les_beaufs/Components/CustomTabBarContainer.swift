//
//  CustomTabBarContainer.swift
//  les_beaufs
//
//  Created by Maxence Gama on 07/07/2022.
//

import SwiftUI

struct CustomTabBarContainer<Content: View>: View {
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            CustomBarItem(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self, perform: {value in
            self.tabs = value
        })
    }
}

struct CustomTabBarContainer_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        .home, .library
    ]
    
    static var previews: some View {
        CustomTabBarContainer(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
