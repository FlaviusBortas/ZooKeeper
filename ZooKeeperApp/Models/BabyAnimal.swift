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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.age = try container.decode(String.self, forKey: .age)
        
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(age, forKey: .age)
        
        try super.encode(to: encoder)
    }
}



extension BabyAnimal {
    
    enum CodingKeys: CodingKey {
        case age
    }
}

