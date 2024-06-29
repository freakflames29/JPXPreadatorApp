//
//  PredatorView.swift
//  JPXPreditor
//
//  Created by sourav das on 29/06/24.
//

import SwiftUI

struct PredatorView: View {
    let prad : JPXpreditorModel
    
    var body: some View {
        GeometryReader{ geo in
            
            ScrollView {
                
                ZStack(alignment: .bottomTrailing){
                    //back img
                    Image(prad.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    Image(prad.img)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3)
                        .scaleEffect(x:-1)
                        .offset(y:20)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/,  radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                        .border(.red,width: 6)
                    
                    // dino img
                    
                    
                } 
               
                
                // dino Title
                
                //Mapkit
                
                // movie appearce
                
                //desc
                
                // link
            }
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
    PredatorView(prad: Predators().allApexPredators[2])
}
