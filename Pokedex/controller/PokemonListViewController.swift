//
//  ViewController.swift
//  Pokedex
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import UIKit
import AVFoundation

class PokemonListViewController: UIViewController,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource,
                             UICollectionViewDelegateFlowLayout,
                             UISearchBarDelegate {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let pokemonListService = PokemonListService()
    private var pokemonArray = [Pokemon]()
    private var musicPlayer: AVAudioPlayer!
    private var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAudio()
        initCollectionView()
        initSearchBar()
        renderPokemon()
    }
    
    private func initAudio() {
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            //TODO
            //musicPlayer.play()
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    private func initCollectionView() {
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
    }
    
    private func initSearchBar() {
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.delegate = self
    }
    
    private func renderPokemon() {
        pokemonArray = pokemonListService.getPokemon(searchText: searchBar.text)
        pokemonCollectionView.reloadData()
    }
    
    @IBAction func onPauseMusicClick(_ sender: UIButton) {
        if musicPlayer.isPlaying {
            sender.alpha = 0.2
            musicPlayer.pause()
        } else {
            sender.alpha = 1.0
            musicPlayer.play()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pokemonArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as? PokemonCollectionViewCell {
            cell.renderPokemon(pokemonArray[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PokemonDetailViewController", sender: pokemonArray[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailViewController" {
            if let detailViewController = segue.destination as? PokemonDetailViewController {
                if let pokemon = sender as? Pokemon {
                    detailViewController.mPokemon = pokemon
                }
            }
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            view.endEditing(true)
        }
        renderPokemon()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }

}

