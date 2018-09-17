//
//  Animal.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/12/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import Foundation

enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
    
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "male", "m":
            self = .male
        case "female", "f":
            self = .female
        default:
            return nil
        }
    }
}

class Animal: Codable {
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

