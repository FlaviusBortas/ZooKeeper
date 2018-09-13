//
//  Animal.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/12/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import Foundation

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

class Animal {
    var name: String
    var species: String
    var gender: Gender
    
    init(name: String, species: String, gender: Gender) {
        self.name = name
        self.species = species
        self.gender = gender
    }
}

extension Animal {
    static var allAnimals: [Animal] = [Animal(name: "Tony", species: "Penguin", gender: .male),
                                       Animal(name: "Tina" , species: "Penguin" , gender: .female),
                                       Animal(name: "George", species: "Jaguar", gender: .male),
                                       Animal(name: "Gene", species: "Jaguar", gender: .female),
                                       Animal(name: "Frank", species: "Camel", gender: .male),
                                       Animal(name: "Felicia", species: "Camel", gender: .female)]
    
    static var allAnimals2: [Animal] = [Animal.penguins.tina, Animal.penguins.tony,
                                        Animal.camels.felicia, Animal.camels.frank,
                                        Animal.jaguars.gene, Animal.jaguars.george]
}

extension Animal {
   static var penguins = (tony: Animal(name: "Tony", species: "Penguin", gender: .male),
                    tina: Animal(name: "Tina", species: "Penguin", gender: .female))
    
    static var jaguars = (george: Animal(name: "George", species: "Jaguar", gender: .male),
                          gene: Animal(name: "Gene", species: "Jaguar", gender: .female))
    
    static var camels = ( frank: Animal(name: "Frank", species: "Camel", gender: .male),
                          felicia: Animal(name: "Felicia", species: "Camel", gender: .female))
}
