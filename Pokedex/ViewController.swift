//
//  ViewController.swift
//  Pokedex
//
//  Created by afbdev on 9/11/16.
//  Copyright © 2016 afbdev. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    
    var inSearchMode = false
    var filteredPokemon = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect delegates and dataSources
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        
        // Change 'Search' to 'Done' in keyboard
        searchBar.returnKeyType = UIReturnKeyType.Done
        
        // Call function when app loads
        initAudio()
        parsePokemonCSV()
    }
    
    
    
    // MUSIC FEATURE
    
    // AUDIO METHOD
    // musicPlayer object initialized above, initAudio method called in viewDidLoad
    
    func initAudio() {
        
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    // Changed sender to 'UIButton' to call for alpha settings
    
    @IBAction func musicButtonPressed(sender: UIButton!) {
        
        if musicPlayer.playing {
            musicPlayer.stop()
            sender.alpha = 0.2
            
        } else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
    
    
    
    // PARSING CSV FILE
    
    func parsePokemonCSV() {
        
        // Create path to file
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        // Parsing file
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                // Create poke object of type Pokemon from data
                let poke = Pokemon(name: name, pokedexId: pokeId)
                // Add created object to data array
                pokemon.append(poke)
            }
            
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    
    
    // COLLECTION VIEW METHODS

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // Setup cell, similar to TableView
        // Need to add cell reuse identifier("PokeCell"), similar to prototype cell
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            
            // Grab pokemon from data array
            let poke: Pokemon!
            if inSearchMode {
                poke = filteredPokemon[indexPath.row]
            } else {
                poke = pokemon[indexPath.row]
            }
            
            // Configure cells with pokemon from data array
            cell.configureCell(poke)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredPokemon.count
        }
        return pokemon.count
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // size of grid
        
        return CGSizeMake(105, 105)
    }
    

    // SEARCH BAR METHODS
    
    // Created filteredArray and inSearchMode boolean above
    // '$0' is on video 10,118 at 9:00
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            // Hide keyboard whenever all text is deleted
            view.endEditing(true)
            collection.reloadData()
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredPokemon = pokemon.filter({$0.name.rangeOfString(lower) != nil})
            
            collection.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        // Hide keyboard when search button is pressed
        view.endEditing(true)
    }
    
    
    
    
    
    
    
    
    
}

