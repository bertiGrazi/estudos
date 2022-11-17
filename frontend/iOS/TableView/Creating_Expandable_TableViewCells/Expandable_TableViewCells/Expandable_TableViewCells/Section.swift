//
//  Section.swift
//  Expandable_TableViewCells
//
//  Created by Grazi  Berti on 30/10/22.
//

import Foundation

class Section {
    let title: String
    let options: [String]
    var isOpened: Bool = true
    
    init(title: String, options: [String], isOpned: Bool = true) {
        self.title = title
        self.options = options
        self.isOpened = isOpned
    }
}
