//
//  FlavorTextEntry.swift
//  PokespeareSDK
//
//  Created by Matteo Gazzato on 03/02/21.
//

struct FlavorTextEntry: Codable {
    let flavorText: String
    let language: Language
    let version: Version
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        
        case language
        case version
    }
}
