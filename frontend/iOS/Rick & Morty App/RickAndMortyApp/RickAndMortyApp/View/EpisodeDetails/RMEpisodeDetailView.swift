//
//  RMEpisodeDetailView.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 26/01/23.
//

import Foundation
import UIKit

final class RMEpisodeDetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
