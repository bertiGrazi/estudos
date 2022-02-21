//
//  NewsViewModel.swift
//  Petition
//
//  Created by Grazielli Berti on 16/02/22.
//

import Foundation

class NewsViewModel {
    var businessModel: NewsProtocol = NewsBusinessModel()
    
    func loadData() -> [Any] {
        return [
            test()
        ]
    }
    
    fileprivate func test() {
        var urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                businessModel.parseOurJSONIntoArray(json: data)
            }
        }
    }
}

