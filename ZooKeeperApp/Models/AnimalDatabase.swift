//
//  AnimalDatabase.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/15/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import Foundation

enum SavePath: String {
    case animals = "Animals.plist"
    case babies = "Babies.plist"
}

class AnimalDatabase {
    
    static let shared = AnimalDatabase()
    
    var animals: [Animal] = []
    
    private init() {
        animals = loadData()
    }
    
    func save(newAnimal: Animal) {
        animals.append(newAnimal)
        
        save()
    }
    
    // find the index of the edited animal, then remove the current animal and replace with edited animal.
    func update(editedAnimal: Animal) {
        guard let index = animals.index(where: {$0 === editedAnimal}) else {
            print("Could not find animal")
            return
        }
        
        animals.remove(at: index)
        animals.insert(editedAnimal, at: index)
        save()
    }
    
    func delete(animal: Animal) {
        guard let index = animals.index(where: {$0 === animal}) else {
            print("Could not find animal")
            return
        }
        animals.remove(at: index)
        save()
    }
}

private extension AnimalDatabase {
    
    func path(to path: SavePath) -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(path.rawValue)
    }
    
    func loadData() -> [Animal] {
        let animals = loadAnimals()
        let babies = loadBabies() as [Animal]
        let all = animals + babies
        
        if all.isEmpty {
            return Animal.defaultAnimals
        } else {
            return all
        }
    }
    
    func loadAnimals() -> [Animal] {
        guard let animalsData = try? Data(contentsOf: path(to: .animals)) else {
            return []
        }
        
        let decoder = PropertyListDecoder()
        
        do {
            let animals = try decoder.decode([Animal].self, from: animalsData)
            return animals
        } catch {
            print("Couldnt Decode Animals in array")
            return []
        }
    }
    
    func loadBabies() -> [BabyAnimal] {
        guard let babiesData = try? Data(contentsOf: path(to: .babies)) else {
            return []
        }
        
        let decoder = PropertyListDecoder()
        
        do {
            let animals = try decoder.decode([BabyAnimal].self, from: babiesData)
            return animals
        } catch {
            print("Couldnt Decode Animals in array")
            return []
        }
    }
    
    func save(animals: [Animal])  {
        let encoder = PropertyListEncoder()
        
        // create an array of only babies
        // compactMap returns an array where the predicate/ closure is true
        let onlyBabies = animals.compactMap { $0 as? BabyAnimal }
        
        // filter through the animals array and return the animals where the current animal is not contained in the babies array.
        let onlyAnimals = animals.filter( { animal in
            return !onlyBabies.contains(where: { baby in
                baby.name == animal.name
            })
        })
        
        do {
            let animalData = try encoder.encode(onlyAnimals)
            try animalData.write(to: path(to: .animals), options: .atomic)
            
            let babyData = try encoder.encode(onlyBabies)
            try babyData.write(to: path(to: .babies), options: .atomic)
            
        } catch {
            print("Error saving")
        }
    }
    
    func save() {
        save(animals: animals)
    }
    
}

















