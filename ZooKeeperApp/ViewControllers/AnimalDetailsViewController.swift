//
//  AnimalDetailsViewController.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/13/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

protocol EditAnimalDelegate {
    func updateAnimal(_ updatedAnimal: Animal)
}

class AnimalDetailsViewController: UIViewController {
    
    //MARK: - UI Elements
    
    @IBOutlet weak var animalName: UITextField!
    @IBOutlet weak var animalSpecies: UITextField!
    @IBOutlet weak var animalGender: UITextField!
    @IBOutlet weak var animalAge: UITextField!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    //MARK: - Properties
    
    var delegate: EditAnimalDelegate?
    var animal: Animal?
    
    //MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAnimalDetails()
        useLargeTitles()
    }
    
    //MARK: - Actions
    
    @IBAction func editTapped(_ sender: UIBarButtonItem) {
        guard var animal = animal else {
            print("No animal found.")
            return
        }
        
        if sender.title == "Edit" {
            sender.title = "Done"
            
            enableTextFields()
            
            if animalAge.text == "Adult" {
                animalAge.isEnabled = false
            }
            
            animalName.becomeFirstResponder()
        } else {
            sender.title = "Edit"
            
            animal.name = animalName.text ?? ""
            animal.species = animalSpecies.text ?? ""
            
            if let gender = Gender(rawValue: animalGender.text ?? "") {
                animal.gender = gender
            }
            
            if let babyAnimal = animal as? BabyAnimal {
                babyAnimal.age = animalAge.text ?? ""
                animal = babyAnimal
            }
            
            disableTextFields()
            
            delegate?.updateAnimal(animal)
            
            navigationController?.popViewController(animated: true)
        }
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
            animalAge.text = "Adult"
            return
        }
        animalAge.text = babyAge
    }
    
    
    func enableTextFields() {
        animalName.isEnabled = true
        animalSpecies.isEnabled = true
        animalGender.isEnabled = true
        animalAge.isEnabled = true
    }
    
    func disableTextFields() {
        animalName.isEnabled = false
        animalSpecies.isEnabled = false
        animalGender.isEnabled = false
        animalAge.isEnabled = false
    }
    
    func useLargeTitles() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
