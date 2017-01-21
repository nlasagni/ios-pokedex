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
    
    func getPokemon() -> [Pokemon] {
        var pokemonArray = [Pokemon]()
        let rows = parseCSV()
        for row in rows {
            let id = Int(row["id"]!)!
            let name = row["identifier"]!
            let pokemon = Pokemon(id: id, name: name)
            pokemonArray.append(pokemon)
        }
        return pokemonArray
    }
    
    private func parseCSV() -> [Dictionary<String, String>] {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        do {
            let csv = try CSVParser(contentsOfURL: path)
            return csv.rows
        } catch let err as NSError {
            //handle the error
            print(err.debugDescription)
        }
        
        return [Dictionary<String, String>]()
    }
    
}
