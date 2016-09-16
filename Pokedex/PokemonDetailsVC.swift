//
//  PokemonDetailsVC.swift
//  Pokedex
//
//  Created by afbdev on 9/13/16.
//  Copyright © 2016 afbdev. All rights reserved.
//

import UIKit
import Alamofire

class PokemonDetailsVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var defenseLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var pokedexId: UILabel!
    @IBOutlet var baseAttack: UILabel!
    
    @IBOutlet var evoLabel: UILabel!
    @IBOutlet var currentEvoImage: UIImageView!
    @IBOutlet var nextEvoImage: UIImageView!
    
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalized
        
        let img = UIImage(named: String(pokemon.pokedexId))
        mainImage.image = img
        currentEvoImage.image = img
        
        pokemon.downloadPokemonDetails {
            //this will be called after download is done
            self.updateUI()
        }
        
    }
    
    
    func updateUI() {
        
        descriptionLabel.text = pokemon.description
        typeLabel.text = pokemon.type
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        pokedexId.text = String(pokemon.pokedexId)
        baseAttack.text = pokemon.attack
        nextEvoImage.image = UIImage(named: pokemon.nextEvolutionId)
        
        if pokemon.nextEvolutionId == "" {
            evoLabel.text = "No Evolutions"
            nextEvoImage.isHidden = true
        } else {
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionText)"
            
            if pokemon.nextEvolutionLevel != "" {
                str += " - LVL \(pokemon.nextEvolutionLevel)"
            }
            evoLabel.text = str
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
