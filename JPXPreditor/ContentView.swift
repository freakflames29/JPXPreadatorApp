//
//  ContentView.swift
//  JPXPreditor
//
//  Created by sourav das on 23/06/24.
//

import SwiftUI

struct ContentView: View {
    let dinos = Predators()
    @State var serachText : String = "" // to track serach items
    @State var names: Bool = false  // to track sort by names or movie
    @State var currentSelection : JPXpreditorModel.predatorType = .all // to track menu items
    @State var exToggle : Bool = false
    
    
    var dinoListFiltered : [JPXpreditorModel] {
        
        dinos.filter(by: currentSelection)
        dinos.sort(by: names)
        
       return dinos.search(for: serachText)
    }
    
    
    var body: some View {
        NavigationStack{
            
//            Text("Lukka")
//                .navigationTitle("Pukka")
            
            List(dinoListFiltered){ dino in
                
                NavigationLink{
                   
                     PredatorView(prad: dino)
                       
                    
                    
                } label:{
                    HStack{
                        // dino img
                        
                        Image(dino.img)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                            .shadow(color: .gray, radius:4,x:4)
                        
                        VStack(alignment: .leading){
                            // dino title
                            
                            Text(dino.name)
                                .bold()
                            
                            
                            // dino type
                            Text(dino.type.rawValue.capitalized)
                                .fontWeight(.semibold)
                                .padding(.horizontal,10)
                                .padding(.vertical,4)
                                .background(dino.type.backColor)
                                .clipShape(.capsule)
                            
                        }
                    }
                }
                
                
            }
            .navigationTitle("Apex Predator")
            .searchable(text: $serachText)
            .autocorrectionDisabled()
            .animation(.smooth,value: serachText)
            .toolbar{
                ToolbarItem(placement: .topBarLeading ){
                    Button {
                        withAnimation{
                            self.names.toggle()
                        }
                        } label: {
                        Image(systemName: self.names ? "film" : "textformat")
                                .symbolEffect(.bounce, value: self.names)
                    }
                }
                ToolbarItem(placement: .topBarTrailing, content: {
                    Menu {
                        Picker("Filter",selection: $currentSelection.animation()){
                            ForEach(JPXpreditorModel.predatorType.allCases) { type in
                                Label(type.rawValue.capitalized,   systemImage: type.icon)
                            }
                        }
                    
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                    
                    
                })
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
