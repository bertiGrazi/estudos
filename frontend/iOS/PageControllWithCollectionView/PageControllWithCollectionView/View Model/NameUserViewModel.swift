//
//  NameUserViewModel.swift
//  PageControllWithCollectionView
//
//  Created by Grazi  Berti on 11/12/22.
//

import Foundation

class NameUserViewModel {
    var businessModel: NameUserProtocol = NameUserBusinessModel()
    
    func fetchNameUserList() -> [NameUser] {
        return businessModel.fetchNameUserList()
    }
}
