//
//  Predators.swift
//  JPXPreditor
//
//  Created by sourav das on 23/06/24.
//

import Foundation

class Predators {
    var apexPredators : [JPXpreditorModel]   = []
    
    var allApexPredators : [JPXpreditorModel] = []
    
    
    init(){
        
        decodeApexpredatorData()
    }
    
    
    func decodeApexpredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                allApexPredators = try decoder.decode( [JPXpreditorModel].self, from: data)
                
                apexPredators = allApexPredators
                
                
            }
            catch {
                print("Error decoing the data : \(error)")
            }
        }
    }
    
    func search(for searchTerm: String ) -> [JPXpreditorModel] {
        if searchTerm.isEmpty {
            return apexPredators
            
        }
        else {
            return apexPredators.filter { dino in
                dino.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    
    func sort(by alphabetical: Bool){
        apexPredators.sort { p1,p2  in
            if alphabetical{
                p1.name < p2.name
            }
            else {
                p1.id < p2.id
            }
        }
    }
    
    
    func filter(by type: JPXpreditorModel.predatorType) {
        
        if type == .all {
            apexPredators = allApexPredators
        }
        else
        {
            apexPredators  = allApexPredators.filter{ pred in
                
                pred.type == type
                
            }
        }
    }
    
}



