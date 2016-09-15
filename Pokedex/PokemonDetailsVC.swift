//
//  PokemonDetailsVC.swift
//  Pokedex
//
//  Created by afbdev on 9/13/16.
//  Copyright © 2016 afbdev. All rights reserved.
//

import UIKit

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
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
