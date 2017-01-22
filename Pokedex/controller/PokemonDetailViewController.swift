//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonDetailBackView: UIView!
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
    @IBOutlet weak var pokemonCurrentEvoImage: UIImageView!
    @IBOutlet weak var pokemonNextEvoImage: UIImageView!

    private var _mPokemon: Pokemon!
    var mPokemon: Pokemon {
        get {
            return _mPokemon
        }
        set {
            _mPokemon = newValue
        }
    }
    
    private var pokemonDetailService = PokemonDetailService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonDetailBackView.layer.cornerRadius = 5.0
        pokemonDetailService.getPokemon(pokemon: mPokemon) { (pokemon: Pokemon) in
            self.renderPokemon(pokemon: pokemon)
        }
    }
    
    private func renderPokemon(pokemon: Pokemon) {
        let image = UIImage(named: pokemon.imageName)
        pokemonMainImage.image = image
        pokemonCurrentEvoImage.image = image
        
        pokemonPokedexIdLabel.text = pokemon.pokedexId
        pokemonNameLabel.text = pokemon.name
        pokemonDescriptionLabel.text = pokemon.description
        pokemonTypeLabel.text = pokemon.type
        pokemonDefenseLabel.text = pokemon.defense
        pokemonHeightLabel.text = pokemon.height
        pokemonWeightLabel.text = pokemon.weight
        pokemonBaseAttackLabel.text = pokemon.baseAttack
        
        if pokemon.hasEvolution {
            let evoImage = UIImage(named: pokemon.nextEvolutionImageName)
            pokemonNextEvoImage.image = evoImage
        }
        pokemonNextEvoImage.isHidden = !pokemon.hasEvolution
        pokemonEvolutionLabel.text = pokemon.nextEvolutionDescription
    }

    @IBAction func onBackButtonClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
