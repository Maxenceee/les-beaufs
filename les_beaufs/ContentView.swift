//
//  ContentView.swift
//  les_beaufs
//
//  Created by Maxence Gama on 01/07/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "star")
                }
                .tag(Tab.featured)

            LibPage()
                .tabItem {
                    Label("Library", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
