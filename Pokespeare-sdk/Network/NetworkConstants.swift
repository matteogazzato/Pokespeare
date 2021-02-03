//
//  NetworkConstants.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 02/02/21.
//

import Alamofire

struct NetworkConstants {
    static var basePokemonAPIUrlString = "https://pokeapi.co/api/v2/"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

//enum HTTPHeaderValue: String {
//    
//}

enum ContentType: String {
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum APIError: Error {
    case badRequest             //Status code 400
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
    case unknown                //Unknown
    case badUrl
}


