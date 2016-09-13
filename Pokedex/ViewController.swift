//
//  ViewController.swift
//  Pokedex
//
//  Created by afbdev on 9/11/16.
//  Copyright © 2016 afbdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    
    var pokemon = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect collection delegate and dataSource
        collection.delegate = self
        collection.dataSource = self
        
        // Call function when app loads
        parsePokemonCSV()
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
            let poke = pokemon[indexPath.row]
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
        return 718
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // size of grid
        
        return CGSizeMake(105, 105)
    }
    
    
    
    
    
    
}

