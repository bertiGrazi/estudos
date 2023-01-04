//
//  RMCharacterGender.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 03/01/23.
//

import Foundation

enum RMCharacterGender: String, Codable {
    /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case `unknown` = "unknown"
}
