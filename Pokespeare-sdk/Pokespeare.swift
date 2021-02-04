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
            .subscribe { response in
                guard let description = PokespeareHelpers.filter(flavorTextEntries: response.flavorTextEntries,
                                                                 forVersion: self.version) else {
                    completion(nil, PokespeareError(.missingDescription(pokemonName, self.version.rawValue)))
                    return
                }
                let shakespeareDesc = ShakespeareAPIDescriptor(textToTranslate: description)
                ShakespeareAPIClient.shakespeareanDescription(fromDesc: shakespeareDesc)
                    .subscribe { response in
                        completion(response.contents.translated, nil)
                    } onError: { error in
                        NSLog(error.localizedDescription)
                        completion(nil, error)
                    }
                    .disposed(by: self.bag)
            } onError: { error in
                NSLog(error.localizedDescription)
                completion(nil, error)
            }
            .disposed(by: bag)
    }
}
