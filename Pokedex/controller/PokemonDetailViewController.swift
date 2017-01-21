//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    private var mPokemon: Pokemon!
    var pokemon: Pokemon {
        get {
            return mPokemon
        }
        set {
            mPokemon = newValue
        }
    }

    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonMainImage: UIImageView!
    @IBOutlet weak var pokemonDescriptionLabel: UILabel!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    @IBOutlet weak var pokemonDefenseLabel: UILabel!
    @IBOutlet weak var pokemonHeightLabel: UILabel!
    @IBOutlet weak var pokemonPokedexIdLabel: UILabel!
    @IBOutlet weak var pokemonWeightLabel: UILabel!
    @IBOutlet weak var pokemonBaseAttackLabel: UILabel!
    @IBOutlet weak var pokemonEvolutionLabel: UILabel!
    @IBOutlet weak var pokemonCurrentEvolutionLabel: UIImageView!
    @IBOutlet weak var pokemonNextEvolutionLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonNameLabel.text = pokemon.name
        
    }

    @IBAction func onBackButtonClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
