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
    var animals: [Animal] {
        return AnimalDatabase.shared.animals.filter { $0.species == species }
    }
    
    init(species: String) {
        self.species = species
    }
}

