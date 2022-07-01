//
//  HomePage.swift
//  les_beaufs
//
//  Created by Maxence Gama on 01/07/2022.
//

import SwiftUI
import FirebaseFirestore

struct HomePage: View {
    let database = Firestore.firestore()
    
    var body: some View {
        Text("Home Page")
            .onAppear(perform: fetchFiresoreContent)
    }
    
    func fetchFiresoreContent() {
        print("fetching")
        let docRef = database.document("/collection")
        docRef.getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            print(data)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
