//
//  PokemonDetailService.swift
//  Pokedex
//
//  Created by Nicola Lasagni on 22/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import Alamofire

class PokemonDetailService {
    
    typealias DownloadComplete = (Pokemon) -> ()
    
    private let URL_BASE = "http://pokeapi.co/"
    private let URL_POKEMON = "api/v1/pokemon/"
    
    private var cachePokemonDictionary = Dictionary<Int, Pokemon>()
    
    public func getPokemon(pokemon: Pokemon, completed: @escaping DownloadComplete) {
        let pokemonId = pokemon.id
        if self.cachePokemonDictionary[pokemonId] != nil {
            completed(self.cachePokemonDictionary[pokemonId]!)
        } else {
            downloadPokemonJSON(pokemon: pokemon) { (pokemon: Pokemon) in
                self.cachePokemonDictionary[pokemon.id] = pokemon
                completed(pokemon)
            }
        }
    }
    
    private func downloadPokemonJSON(pokemon: Pokemon, completed: @escaping DownloadComplete) {
        let apiUrl = "\(URL_BASE)\(URL_POKEMON)\(pokemon.id)/"
        Alamofire.request(apiUrl).responseJSON { (response) in
            if let dictionary = response.result.value as? Dictionary<String, AnyObject> {
                var pokemonWeight = ""
                if let weight = dictionary["weight"] as? String {
                    pokemonWeight = weight
                }
                var pokemonHeight = ""
                if let height = dictionary["height"] as? String {
                    pokemonHeight = height
                }
                var pokemonAttack = ""
                if let attack = dictionary["attack"] as? Int {
                    pokemonAttack = "\(attack)"
                }
                var pokemonDefense = ""
                if let defense = dictionary["defense"] as? Int {
                    pokemonDefense = "\(defense)"
                }
                var type = ""
                if let types = dictionary["types"] as? [Dictionary<String, AnyObject>] , types.count > 0 {
                    if let name = types[0]["name"] as? String {
                        type = name.capitalized
                    }
                    if types.count > 1 {
                        for nextType in 1..<types.count {
                            if let name = types[nextType]["name"] as? String {
                                type += "/\(name.capitalized)"
                            }
                        }
                    }
                }
                if let descArray = dictionary["descriptions"] as? [Dictionary<String, String>], descArray.count > 0 {
                    if let url = descArray[0]["resource_uri"] {
                        let descUrl = "\(self.URL_BASE)\(url)"
                        Alamofire.request(descUrl).responseJSON {(response) in
                            if let descDictionary = response.result.value as? Dictionary<String, AnyObject> {
                                if let description = descDictionary["description"] as? String {
                                    let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    pokemon.description = newDescription
                                    completed(pokemon)
                                }
                            }
                        }
                    }
                }
                if let evoArray = dictionary["evolutions"] as? [Dictionary<String, AnyObject>], evoArray.count > 0 {
                    if let evoString = evoArray[0]["to"] as? String {
                        if evoString.range(of: "mega") == nil {
                            pokemon.nextEvolutionName = evoString
                            if let uri = evoArray[0]["resource_uri"] as? String {
                                let nextEvoUri = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoId = nextEvoUri.replacingOccurrences(of: "/", with: "")
                                pokemon.nextEvolutionId = Int(nextEvoId)!
                            }
                            if let levelExist = evoArray[0]["level"] {
                                if let level = levelExist as? Int {
                                    pokemon.nextEvolutionLevel = "\(level)"
                                }
                            }
                        }
                    }
                }
                pokemon.type = type
                pokemon.weight = pokemonWeight
                pokemon.height = pokemonHeight
                pokemon.baseAttack = pokemonAttack
                pokemon.defense = pokemonDefense
            }
            
            completed(pokemon)
        }
    }
    
}
