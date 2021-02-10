//
//  Storage.swift
//  Pokespeare-sdk-examples
//
//  Created by Matteo Gazzato on 10/02/21.
//
import Foundation

class Storage {
    
    static func initialize() {
        let userDefaults = UserDefaults.standard
        do {
            let favs = Favourites()
            try userDefaults.setObject(favs, forKey: "Favourites")
        } catch (let error) {
            NSLog(error.localizedDescription)
        }
    }
    
    static func addToFavourites(_ pokemon: Pokemon) -> Bool {
        let userDefaults = UserDefaults.standard
        do {
            var favs = try userDefaults.getObject(forKey: "Favourites", castTo: Favourites.self)
            favs.pokemonList.append(pokemon)
            
            try userDefaults.setObject(favs, forKey: "Favourites")
            return true
        } catch (let error) {
            NSLog(error.localizedDescription)
            return false
        }
        
    }
    
    static func removeFromFavourites(_ pokemon: Pokemon) -> Bool {
        let userDefaults = UserDefaults.standard
        do {
            var favs = try userDefaults.getObject(forKey: "Favourites", castTo: Favourites.self)
            favs.pokemonList.removeAll { $0.name == pokemon.name }
            try userDefaults.setObject(favs, forKey: "Favourites")
            return true
        } catch (let error) {
            NSLog(error.localizedDescription)
            return false
        }
    }
    
    static func getAllFavourites() -> [Pokemon] {
        let userDefaults = UserDefaults.standard
        do {
            let favs = try userDefaults.getObject(forKey: "Favourites", castTo: Favourites.self)
            return favs.pokemonList
        } catch (let error) {
            NSLog(error.localizedDescription)
            return []
        }
    }
}
