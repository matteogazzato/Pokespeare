//
//  ShakespeareAPI.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 04/02/21.
//
import Alamofire

enum ShakespeareAPI: APIConfiguration {
    
    case translate(_ desc: ShakespeareAPIDescriptor)
    
    var method: HTTPMethod {
        switch self {
        case .translate:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .translate:
            return "shakespeare"
        }
    }
    
    var parameters: Parameters {
        var params: [String: Any] = [:]
        switch self {
        case .translate(let desc):
            params = ["text": desc.textToTranslate]
        
        }
        return params
    }
    
    func asURLRequest() throws -> URLRequest {
        var url: URL?
        switch self {
        case .translate:
            url = URL(string: NetworkConstants.shakespeareAPIBaseUrlString + path)
        }
        
        guard let _url = url else {
            throw APIError.badUrl
        }
        
        var urlRequest = URLRequest(url: _url)
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .post:
                return JSONEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
