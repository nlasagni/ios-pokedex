//
//  PokemonListService.swift
//  Pokedex
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import Foundation

class PokemonListService {
    
    private var pokemonArray = [Pokemon]()
    
    func getPokemon(completion: @escaping (_ pokemonArray: [Pokemon]) -> Void) {
        var pokemonArray = [Pokemon]()
        parseCSV { (rows: [Dictionary<String, String>]) in
            for row in rows {
                let id = Int(row["id"]!)!
                let name = row["identifier"]!
                let pokemon = Pokemon(id: id, name: name)
                pokemonArray.append(pokemon)
            }
            completion(pokemonArray)
        }
    }
    
    private func parseCSV(completion: @escaping (_ rows: [Dictionary<String, String>]) -> Void) {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        DispatchQueue.global().async {
            do {
                let csv = try CSVParser(contentsOfURL: path)
                DispatchQueue.global().sync {
                    completion(csv.rows)
                }
            } catch let err as NSError {
                //handle the error
                print(err.debugDescription)
            }
        }
    }
    
    
}
