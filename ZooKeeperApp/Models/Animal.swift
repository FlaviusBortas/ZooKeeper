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
    
    static var allAnimals: [Animal] = {
        // If I can load data from the plist return that data
        
        // else return defaultAnimals
        
        if false {
            return []
        } else {
            return defaultAnimals
        }
        
    }()
    
//    static var alllAnimals: [Animal] = loadAllAnimals()
    
    // Once app is finished put all of the defaults into the plist
    static var defaultAnimals: [Animal] = [Animal(name: "Tony", species: "Penguin", gender: .male),
                                       Animal(name: "Tina" , species: "Penguin" , gender: .female),
                                       BabyAnimal(name: "Timmy", species: "Penguin", gender: .male, age: "1"),
                                       Animal(name: "Frank", species: "Camel", gender: .male),
                                       Animal(name: "Felicia", species: "Camel", gender: .female),
                                       BabyAnimal(name: "Carmen", species: "Camel", gender: .female, age: "2"),
                                       Animal(name: "George", species: "Jaguar", gender: .male),
                                       Animal(name: "Gene", species: "Jaguar", gender: .female),
                                       BabyAnimal(name: "Jimmy", species: "Jaguar", gender: .male, age: "1")]

}

//func loadAllAnimals() -> [Animal] {
//    if false {
//        return []
//    } else {
//        return Animal.defaultAnimals
//    }
//}
