//
//  HomePage.swift
//  les_beaufs
//
//  Created by Maxence Gama on 01/07/2022.
//

import SwiftUI

struct HomePage: View {
    @ObservedObject var model = FireStoreModel()
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                GeometryReader{proxy -> AnyView in
                    
                    let minY = proxy.frame(in: .global).minY
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    return AnyView(
                        ZStack {
                            Image("banner")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getrect().width, height: minY > 0 ? 180 + minY : nil , alignment: .center)
                                .cornerRadius(0)
                            
                            BlurView()
                                .opacity(blurViewOppacity())
                            
                            VStack(spacing: 5) {
                                Text("Les meilleures blagues")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .opacity(blurViewOppacity())
                            }
                            .offset(y: 60)
                        }
                        .frame(height: minY > 0 ? 180 + minY : nil)
                        .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)
                    )
                }
                .frame(height: 180)
                .zIndex(1)
                
                VStack {
                    VStack(alignment: .center, spacing: 8, content: {
                        Text("Les meilleures blagues")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding(6)
                            .padding(.horizontal, 14)
                            .background(
                                Capsule()
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            .background(Color.white)
                            .cornerRadius(20)
                            .offset(y: offset < 0 ? getOffset() - 35: -35)
                            .scaleEffect(getScale())
                    })
                    
                    VStack(spacing: 18) {
                        ForEach(model.blagues) { item in
                            HomePageBlagueComponent(blague: item)
                        }
                    }
                }
                .zIndex(-offset > 80 ? 0 : 1)
            }
        }
    }
    
    func getOffset() -> CGFloat {
        let progress = (-offset/80) * 20
        
        return progress <= 20 ? progress : 20
    }
    
    func getScale() -> CGFloat {
        let progress = -offset/80
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        
        return scale < 1 ? scale : 1
    }
    
    func blurViewOppacity() -> Double {
        let progress = -(offset + 80) / 150
        
        return Double(-offset > 80 ? progress : 0)
    }
    
    init() {
        model.fetchFiresoreContent()
    }
}
                
struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

