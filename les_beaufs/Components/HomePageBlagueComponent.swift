//
//  HomePageBlagueComponent.swift
//  les_beaufs
//
//  Created by Maxence Gama on 02/07/2022.
//

import SwiftUI

struct HomePageBlagueComponent: View {
    @ObservedObject var model = ViewModel()
    let blague: Blague
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12)  {
                Text(blague.name)
                    .font(.title.weight(.semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("10 mars 2022")
                    .font(.footnote.weight(.semibold))
                
                Text("Lorem ipsum dolor sit amet consectetur, adipisicing elit. Reiciendis, itaque quibusdam! Asperiores quos praesentium quaerat itaque vero iusto, nesciunt dolores sequi cumque corporis inventore enim magnam? Eius quae at doloribus.")
                    .font(.footnote)
                
                Text(blague.author)
                    .font(.footnote.weight(.thin))
                    .multilineTextAlignment(.trailing)
                    .padding(.top, 5)
                    .frame(
                          minWidth: 0,
                          maxWidth: .infinity,
                          alignment: .trailing
                    )
            }
            .padding(20)
        }
        .foregroundStyle(.black)
        .background(Color(hex: "#f2f2f7"))
        .mask(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
        )
        .padding(20)
    }
        
}

struct HomePageBlagueComponent_Previews: PreviewProvider {
    static var previews: some View {
        HomePageBlagueComponent(blague: ViewModel().blagues[0])
    }
}
