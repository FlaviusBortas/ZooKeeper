//
//  Animal.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/12/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import Foundation

class Animal {
    var name: String
    var species: String
    var gender: String
    
    init(name: String, species: String, gender: String) {
        self.name = name
        self.species = species
        self.gender = gender
    }
}

extension Animal {
    static var allAnimals: [Animal] = [Animal(name: "Tony", species: "Penguin", gender: "Male"),
                                       Animal(name: "Tina" , species: "Penguin" , gender: "Female"),
                                       Animal(name: "Jack", species: "Jaguar", gender: "Male"),
                                       Animal(name: "Jenny", species: "Jaguar", gender: "Female")]
}
