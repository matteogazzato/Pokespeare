//
//  PokemonInfoSpritesResponse.swift
//  PokespeareSDK
//
//  Created by Matteo Gazzato on 03/02/21.
//

struct PokemonInfoSpritesResponse: Codable {
    let sprites: Sprite
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case sprites
        case name
    }
    
}
