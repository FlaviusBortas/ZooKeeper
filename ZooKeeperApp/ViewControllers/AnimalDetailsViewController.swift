//
//  AnimalDetailsViewController.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/13/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

class AnimalDetailsViewController: UIViewController {
    
    //MARK: - UI Elements
    
    @IBOutlet weak var animalName: UITextField!
    @IBOutlet weak var animalSpecies: UITextField!
    @IBOutlet weak var animalGender: UITextField!
    @IBOutlet weak var animalAge: UITextField!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    //MARK: - Properties
    
    var animal: Animal?
    
    //MAEK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAnimalDetails()
    }
    
    //MARK: - Actions
    
    @IBAction func editTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Methods
    
    func loadAnimalDetails() {
        guard let animal = animal else {
            print("No Animal Passed In")
            return
        }
        
        animalName.text = animal.name
        animalSpecies.text = animal.species
        animalGender.text = animal.gender.rawValue
        
        guard let babyAge = (animal as? BabyAnimal)?.age else {
            animalAge.text = "Adult \(animal.species)"
            return
        }
        animalAge.text = babyAge
        
    }
}
