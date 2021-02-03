//
//  PokemonInfoDescriptionResponse.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 03/02/21.
//

struct PokemonInfoDescriptionResponse: Codable {
    let flavorTextEntries: [FlavorTextEntry]
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
        
        case name
    }
    
}


