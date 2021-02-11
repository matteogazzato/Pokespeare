//
//  Pokespeare.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 04/02/21.
//
import Foundation
import RxSwift
import RxCocoa

/// PokemonVersion entity represents the different Pokemon game versions
public enum PokemonVersion: String {
    case red = "red"
    case blue = "blue"
    case yellow = "yellow"
    
    //TODO: Add more versions...
}

// MARK: - Public Utils

/// Pokespeare class is the main and only SDK entry point, representing its facade
public class Pokespeare {
    
    private let version: PokemonVersion
    
    public init(withPokemonVersion version: PokemonVersion = .blue) {
        self.version = version
    }
    
    private let bag = DisposeBag()
    
    /// Exposed service that given a Pokemon name returns its Shakespearean description
    /// - Parameters:
    ///   - pokemonName: the name of the Pokemon to search and retrieve description
    ///   - completion:
    ///   If not nil, description string is the Shakespearean description.
    ///   If not nil, error is the raised error from network calls
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
    
    /// Exposed service that given a Pokemon name returns its front sprite
    /// - Parameters:
    ///   - pokemonName: the name of the Pokemon to search and retrieve description
    ///   - completion:
    ///   If not nil, spriteUrl string is the Pokemon sprite url.
    ///   If not nil, error is the raised error from network calls
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
