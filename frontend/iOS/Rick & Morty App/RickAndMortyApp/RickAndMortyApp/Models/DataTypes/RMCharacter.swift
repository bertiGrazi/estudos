//
//  RMCharacter.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 02/01/23.
//

import Foundation

struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    /// origin    object    Name and link to the character's origin location.
    let origin: RMOrigin
    /// location    object    Name and link to the character's last known location endpoint.
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}


//{
//  "id": 1,
//  "name": "Rick Sanchez",
//  "status": "Alive",
//  "species": "Human",
//  "type": "",
//  "gender": "Male",
//  "origin": {
//    "name": "Earth",
//    "url": "https://rickandmortyapi.com/api/location/1"
//  },
//  "location": {
//    "name": "Earth",
//    "url": "https://rickandmortyapi.com/api/location/20"
//  },
//  "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
//  "episode": [
//    "https://rickandmortyapi.com/api/episode/1",
//    "https://rickandmortyapi.com/api/episode/2",
//    // ...
//  ],
//  "url": "https://rickandmortyapi.com/api/character/1",
//  "created": "2017-11-04T18:48:46.250Z"
//},
