//
//  FireStoreModel.swift
//  les_beaufs
//
//  Created by Maxence Gama on 01/07/2022.
//

import Foundation
import FirebaseFirestore

class FireStoreModel: ObservableObject {
    @Published var blagues = [Blague]()
    let db = Firestore.firestore()

    func fetchFiresoreContent() {
        print("fetching")
        db.collection("blagues").getDocuments { snapshot, error in
            guard let data = snapshot, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.blagues = data.documents.map {d in
                    return Blague(id: d.documentID, name: d["name"] as? String ?? "", author: d["author"] as? String ?? "")
                }
            }
        }
    }
}
