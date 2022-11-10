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

protocol MenuProfileViewModelDelegate: AnyObject {
    func sucess()
    func error(_ message: String)
}

class MenuProfileViewModel {
    
    private let service: MenuProfileService = MenuProfileService()
    private weak var delegate: MenuProfileViewModelDelegate?
    private var data: [MenuProfile] = []
    private var hiddenSection = Set<Int>()
    
    public func delegate(delegate: MenuProfileViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { sucess, error in
                if let sucess = sucess {
                    self.data = sucess.group ?? []
                    self.delegate?.sucess()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getMenu { sucess, error in
                if let sucess = sucess {
                    self.data = sucess.group ?? []
                    self.delegate?.sucess()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfSection: Int {
        return data.count
    }
    
    public func titleForSection(section: Int) -> String{
        return self.data[section].title 
    }
    
    public func constainsSection(_ section: Int) -> Bool {
        return self.hiddenSection.contains(section)
    }
}
