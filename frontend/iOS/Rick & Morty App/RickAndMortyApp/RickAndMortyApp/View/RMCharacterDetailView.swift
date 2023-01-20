//
//  RMCharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 13/01/23.
//

import Foundation
import UIKit

/// View for single character info
final class RMCharacterDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
