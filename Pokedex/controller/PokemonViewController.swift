//
//  ViewController.swift
//  Pokedex
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as? PokemonCollectionViewCell {
            
            //TODO
            let pokemon = Pokemon(id: (indexPath.row + 1), name: "Pokemon")
            cell.renderPokemon(pokemon: pokemon)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO
    }


}

