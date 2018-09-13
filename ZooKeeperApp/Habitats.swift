//
//  Habitats.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/12/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import Foundation

enum Climate: String {
    case artic = "Artic"
    case desert = "Desert"
    case forrest = "Forrest"
    
    static let allClimates: [Climate] = [.artic, .desert, .forrest]
    
}

class Habitat {
    var climate: Climate
    var pen: Pen
    
    init(climate: Climate, pen: Pen) {
        self.climate = climate
        self.pen = pen
    }
}

extension Habitat {
    static let allHabitats: [Habitat] = [Habitat(climate: .artic, pen: Pen(animals: [Animal.allAnimals2[0], Animal.allAnimals2[1]])),
                                         Habitat(climate: .desert, pen: Pen(animals: [Animal.allAnimals2[2], Animal.allAnimals2[3]])),
                                         Habitat(climate: .forrest, pen: Pen(animals: [Animal.allAnimals2[4], Animal.allAnimals2[5]]))]
}
