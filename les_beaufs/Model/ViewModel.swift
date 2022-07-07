//
//  ViewModel.swift
//  les_beaufs
//
//  Created by Maxence Gama on 01/07/2022.
//

import Foundation
import SwiftUI
import CoreData

class ViewModel: ObservableObject {
    @Published var blagues = [Blague]() // = load("landmarkData.json")
    
//    public static func defaultItems() -> [Blague]{
//            let store = NSPersistentContainer(name: "ItemStore")
//            store.loadPersistentStores { (desc, err) in
//                if let err = err {
//                    fatalError("core data error: \(err)")
//                }
//            }
//            let context = store.viewContext
//            let item = Blague(context: context)
//            item.title = "hello you"
//            try! context.save()
//            return [
//                item,
//                item,
//            ]
//        }
}
