//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
    }
    
    func renderPokemon(pokemon: Pokemon) {
        pokemonNameLabel.text = pokemon.name.capitalized
        pokemonImage.image = UIImage(named: pokemon.imageName)
    }
    
    
}
