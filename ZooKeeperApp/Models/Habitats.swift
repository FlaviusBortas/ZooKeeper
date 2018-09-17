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
    var pens: [Pen]
    
    init(climate: Climate, pens: [Pen]) {
        self.climate = climate
        self.pens = pens
    }
}

extension Habitat {
    static var allHabitats: [Habitat] {
        return [Habitat(climate: .artic, pens: [Pen(species: "Penguin")]),
                Habitat(climate: .desert, pens: [Pen(species: "Camel")]),
                Habitat(climate: .forrest, pens: [Pen(species: "Jaguar")])]
    }
}

private let database = AnimalDatabase.shared
