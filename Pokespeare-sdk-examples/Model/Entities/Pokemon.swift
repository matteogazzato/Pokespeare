//
//  Pokemon.swift
//  Pokespeare-sdk-examples
//
//  Created by Matteo Gazzato on 10/02/21.
//

struct Pokemon: Codable {
    var name: String = ""
    var description: String = ""
    var sprite: String = ""
    var favourite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case sprite
    }
}
