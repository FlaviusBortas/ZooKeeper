//
//  Habitats.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/12/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import Foundation

enum HabitatEnviornment: String {
    case artic = "Artic"
    case desert = "Desert"
    case forrest = "Forrest"
}

class Habitat {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Habitat {
    static var allHabitats: [Habitat] = [Habitat(name: "Artic"),
                                         Habitat(name: "Desert"),
                                         Habitat(name: "Forrest")]
}
