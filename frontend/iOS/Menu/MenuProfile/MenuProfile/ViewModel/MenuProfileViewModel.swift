//
//  MenuProfileViewModel.swift
//  MenuProfile
//
//  Created by Grazi  Berti on 09/11/22.
//

import UIKit

enum TypeFetch {
    case mock
    case request
}

class MenuProfileViewModel {
    
    private let service: MenuProfileService = MenuProfileService()
    
    public func fetch(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { sucess, error in
                print(sucess)
            }
        case .request:
            self.service.getMenu { sucess, error in
                print(error)
            }
        }
        
    }
}
