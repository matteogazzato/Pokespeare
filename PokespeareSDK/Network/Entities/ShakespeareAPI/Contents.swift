//
//  Contents.swift
//  PokespeareSDK
//
//  Created by Matteo Gazzato on 04/02/21.
//

struct Contents: Codable {
    let translated: String
    let sourceText: String
    
    enum CodingKeys: String, CodingKey {
        case sourceText = "text"
        
        case translated
    }
}
