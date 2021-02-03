//
//  PokemonInfoAPIClient.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 03/02/21.
//

import Alamofire
import RxSwift

class PokemonInfoAPIClient {
    static func pokemonDescription(fromDescriptor desc: PokemonInfoAPIDescriptor) -> Observable<PokemonInfoDescriptionResponse> {
        return NetworkClient.request(PokemonInfoAPI.description(desc))
    }
    
    static func pokemonSprites(fromDescriptor desc: PokemonInfoAPIDescriptor) -> Observable<PokemonInfoSpritesResponse> {
        return NetworkClient.request(PokemonInfoAPI.sprites(desc))
    }
}
