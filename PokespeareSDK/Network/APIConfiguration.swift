//
//  APIConfiguration.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 02/02/21.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters { get }
}
