//
//  BabyAnimal.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/12/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import Foundation

class BabyAnimal: Animal {
    var age: String
    
    init(name: String, species: String, gender: Gender, age: String) {
        self.age = age
        super.init(name: name, species: species, gender: gender)
    }
}
