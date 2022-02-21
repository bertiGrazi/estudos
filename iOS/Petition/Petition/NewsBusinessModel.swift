//
//  NewsBusinessModel.swift
//  Petition
//
//  Created by Grazielli Berti on 16/02/22.
//

import Foundation
import UIKit

class NewsBusinessModel: NewsProtocol {
    var petitions = [Petition]()
    
    func parseOurJSONIntoArray(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            print(jsonPetitions)
        }
    }
}
