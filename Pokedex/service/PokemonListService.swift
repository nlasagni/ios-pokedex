//
//  PokemonListService.swift
//  Pokedex
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import Foundation

class PokemonListService {
    
    private var cachePokemonArray = [Pokemon]()
    private var filteredPokemonArray = [Pokemon]()
    
    func getPokemon(searchText: String?) -> [Pokemon] {
        if searchText == nil || searchText == "" {
            return getPokemon()
        } else {
            return getFilteredPokemon(searchText: (searchText)!.lowercased())
        }
    }
    
    private func getPokemon() -> [Pokemon] {
        if cachePokemonArray.count > 0 {
            return cachePokemonArray
        }
        let rows = parseCSV()
        for row in rows {
            let id = Int(row["id"]!)!
            let name = row["identifier"]!.capitalized
            let pokemon = Pokemon(id: id, name: name)
            cachePokemonArray.append(pokemon)
        }
        return cachePokemonArray
    }
    
    private func getFilteredPokemon(searchText: String) -> [Pokemon] {
        return getPokemon().filter({
            $0.name.range(of: searchText) != nil
        })
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
