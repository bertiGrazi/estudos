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

enum TypeHiddenSection {
    case remove
    case insert
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
                    self.hiddenAllSection()
                    self.delegate?.sucess()
                   
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getMenu { sucess, error in
                if let sucess = sucess {
                    self.data = sucess.group ?? []
                    self.hiddenAllSection()
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
    
    public func tappdeSection(type: TypeHiddenSection, section: Int) {
        if type == .insert {
            self.hiddenSection.insert(section)
        } else {
            self.hiddenSection.remove(section)
        }
    }
    
    public func indexPathForSection(_ section: Int) -> [IndexPath] {
        var indexPath = [IndexPath]()
        let size = self.childCount(section)
        for row in 0..<size {
            indexPath.append(IndexPath(row: row, section: section))
        }
        
        return indexPath
    }
    
    private func childCount(_ section: Int) -> Int {
        return self.data[section].child?.count ?? 0
    }
    
    public func numberOfRowsInSection(section: Int) -> Int {
        if self.constainsSection(section) {
            return 0
        } else {
            return self.childCount(section)
        }
    }
    
    private func hiddenAllSection() {
        //percorre todo mundo e insere no nosso index
        let size = self.numberOfSection
        for indexMenu in 0..<size {
            self.hiddenSection.insert(indexMenu)
        }
    }
}
