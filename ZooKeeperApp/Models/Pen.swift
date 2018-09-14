//
//  Pen.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/12/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import Foundation

class Pen {
    let species: String
    var animals: [Animal]
    
    init(species: String, animals: [Animal]) {
        self.species = species
        self.animals = animals
    }
}

