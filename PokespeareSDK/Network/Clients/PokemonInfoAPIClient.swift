//
//  PokemonInfoAPIClient.swift
//  PokespeareSDK
//
//  Created by Matteo Gazzato on 03/02/21.
//

import Alamofire
import RxSwift

class PokemonInfoAPIClient {
    static func pokemonDescriptions(fromDescriptor desc: PokemonInfoAPIDescriptor) -> Observable<PokemonInfoDescriptionResponse> {
        return NetworkClient.request(PokemonInfoAPI.descriptions(desc))
    }
    
    static func pokemonSprites(fromDescriptor desc: PokemonInfoAPIDescriptor) -> Observable<PokemonInfoSpritesResponse> {
        return NetworkClient.request(PokemonInfoAPI.sprites(desc))
    }
}
