//
//  BlagueDetail.swift
//  les_beaufs
//
//  Created by Maxence Gama on 01/07/2022.
//

import SwiftUI

struct BlagueDetail: View {
    @ObservedObject var model = ViewModel()
    
    var blague: Blague
    
    var body: some View {
        Text(blague.name)
    }
}

struct BlagueDetail_Previews: PreviewProvider {
    static var previews: some View {
        BlagueDetail(blague: ViewModel().blagues[0])
    }
}
