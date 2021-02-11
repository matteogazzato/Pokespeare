//
//  Sprite.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 03/02/21.
//

struct Sprite: Codable {
    
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
