//
//  PokemonInfoAPI.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 03/02/21.
//

import Alamofire

enum PokemonInfoAPI: APIConfiguration {
    
    case descriptions(_ desc: PokemonInfoAPIDescriptor)
    case sprites(_ desc: PokemonInfoAPIDescriptor)
    
    var method: HTTPMethod {
        switch self {
        case .descriptions(_), .sprites(_):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .descriptions(let desc):
            return "pokemon-species/\(desc.name)"
        case .sprites(let desc):
            return "pokemon/\(desc.name)"
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .descriptions(_), .sprites(_):
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var url: URL?
        switch self {
        case .descriptions(_), .sprites(_):
            url = URL(string: NetworkConstants.basePokemonAPIUrlString + path)
        }
        guard let _url = url else {
            throw APIError.badUrl
        }
        var urlRequest = URLRequest(url: _url)
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
        
    }
}
