//
//  PokeCell.swift
//  Pokedex
//
//  Created by afbdev on 9/12/16.
//  Copyright © 2016 afbdev. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    
    //
    /* override init(frame: CGRect){
        super.init(frame: frame)
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Rounding corners of cell
        layer.cornerRadius = 10.0
    }
    
    
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        
        nameLabel.text = self.pokemon.name.capitalized
        thumbImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
    
}
