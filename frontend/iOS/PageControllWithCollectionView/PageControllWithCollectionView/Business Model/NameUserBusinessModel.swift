//
//  NameUserBusinessModel.swift
//  PageControllWithCollectionView
//
//  Created by Grazi  Berti on 11/12/22.
//

import Foundation

class NameUserBusinessModel: NameUserProtocol {
    func fetchNameUserList() -> [NameUser] {
       return [
            NameUser(nameUser: "Grazielli"),
            NameUser(nameUser: "Jeronima"),
            NameUser(nameUser: "Cicera"),
            NameUser(nameUser: "Grazielli"),
            NameUser(nameUser: "Jeronima"),
            NameUser(nameUser: "Cicera"),
       ]
    }
}
