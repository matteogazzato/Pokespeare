//
//  ShakespeareAPIClient.swift
//  PokespeareSDK
//
//  Created by Matteo Gazzato on 04/02/21.
//
import Alamofire
import RxSwift

class ShakespeareAPIClient {
    static func shakespeareanDescription(fromDesc desc: ShakespeareAPIDescriptor) -> Observable<ShakespeareDescriptionResponse> {
        return NetworkClient.request(ShakespeareAPI.translate(desc))
    }
}
