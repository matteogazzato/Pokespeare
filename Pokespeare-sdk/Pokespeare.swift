//
//  Pokespeare.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 04/02/21.
//
import Foundation
import RxSwift
import RxCocoa

public enum PokemonVersion: String {
    case red = "red"
    case blue = "blue"
    case yellow = "yellow"
    
    //TODO: Add more versions...
}

// MARK: - Public Utils
public class Pokespeare {
    
    private let version: PokemonVersion
    
    public init(withPokemonVersion version: PokemonVersion = .blue) {
        self.version = version
    }
    
    private let bag = DisposeBag()
    
    public func retrieveDescription(ofPokemon pokemonName: String, completion: @escaping (_ description: String?, _ error: Error?) -> Void) {
        let pokemonInfodesc = PokemonInfoAPIDescriptor(name: pokemonName)
        PokemonInfoAPIClient.pokemonDescriptions(fromDescriptor: pokemonInfodesc)
            .flatMap { pokemonResponse -> Observable<ShakespeareDescriptionResponse> in
                guard let description = PokespeareHelpers.filter(flavorTextEntries: pokemonResponse.flavorTextEntries,
                                                                 forVersion: self.version) else {
                    throw PokespeareError(.missingDescription(pokemonName, self.version.rawValue))
                }
                let shakespeareDesc = ShakespeareAPIDescriptor(textToTranslate: description)
                return ShakespeareAPIClient.shakespeareanDescription(fromDesc: shakespeareDesc)
            }.subscribe { shakespeareDescriptionResponse in
                completion(shakespeareDescriptionResponse.contents.translated, nil)
            } onError: { error in
                completion(nil, error)
            }
            .disposed(by: bag)
    }
    
    public func retrieveSprite(ofPokemon pokemonName: String, completion: @escaping (_ spriteUrl: String?, _ error: Error?) -> Void) {
        let pokemonInfodesc = PokemonInfoAPIDescriptor(name: pokemonName)
        PokemonInfoAPIClient.pokemonSprites(fromDescriptor: pokemonInfodesc)
            .subscribe { pokemonResponse in
                completion(pokemonResponse.sprites.frontDefault, nil)
            } onError: { error in
                completion(nil, error)
            }
            .disposed(by: bag)
    }
}
