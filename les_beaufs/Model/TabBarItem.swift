//
//  TabBarItem.swift
//  les_beaufs
//
//  Created by Maxence Gama on 07/07/2022.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}


enum TabBarItem: Hashable {
    case home, library
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .library: return "list.bullet"
        }
    }
    var title: String {
        switch self {
        case .home: return "Home"
        case .library: return "Library"
        }
    }
    var color: Color {
        switch self {
        case .home: return Color.red
        case .library: return Color.blue
        }
    }
}

