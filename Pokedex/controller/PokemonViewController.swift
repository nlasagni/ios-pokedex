//
//  ViewController.swift
//  Pokedex
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import UIKit
import AVFoundation

class PokemonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    private let pokemonListService = PokemonListService()
    private var pokemonArray = [Pokemon]()
    private var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
        pokemonArray = pokemonListService.getPokemon()
        pokemonCollectionView.reloadData()
        
        initAudio()
    }
    
    private func initAudio() {
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        } catch let error as NSError {
            print(error.debugDescription)
        }
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
        //TODO
    }


}

