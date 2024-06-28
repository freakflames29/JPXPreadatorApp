//
//  JPXpreditorModel.swift
//  JPXPreditor
//
//  Created by sourav das on 23/06/24.
//

import Foundation
import SwiftUI

struct JPXpreditorModel : Decodable , Identifiable {
    let id : Int
    let name : String
    let type : predatorType
    let latitude : Double
    let longitude : Double
    let movies : [String]
    let movieScenes : [MovieScenes]
    let link : String
    
    var img: String {
        self.name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    
    struct MovieScenes : Decodable, Identifiable {
        let id : Int
        let movie : String
        let sceneDescription : String
    }
    
    enum predatorType : String,Decodable,CaseIterable,Identifiable {
        case all
        case land
        case sea
        case air
         
        var id : predatorType {self}
        
        var backColor : Color{
            switch self {
                case .all :
                        .black
                case .land:
                        .brown
                case .air:
                        .teal
                case .sea:
                        .blue
            }
        }
        var icon : String {
            switch self {
                case .all :
                    "square.stack.3d.up.fill"
                case .land:
                    "leaf.fill"
                case .sea:
                    "drop.fill"
                case .air:
                    "wind"
            }
        }
    }
}
