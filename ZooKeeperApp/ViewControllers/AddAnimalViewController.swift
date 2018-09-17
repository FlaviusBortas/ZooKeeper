//
//  AddAnimalViewController.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/14/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

protocol AddAnimalDelegate: AnyObject {
    func addNewAnimal(_ newAnimal: Animal)
    func addNewBaby(_ newBaby: BabyAnimal)
}

class AddAnimalViewController: UIViewController {

    //MARK: - UI Elelments
    
    @IBOutlet weak var animalName: UITextField!
    @IBOutlet weak var animalSpecies: UITextField!
    @IBOutlet weak var animalGender: UITextField!
    @IBOutlet weak var animalAge: UITextField!
    @IBOutlet weak var babySwitch: UISwitch!
    
    //MARK: - Properties
    
    weak var delegate: AddAnimalDelegate?
    
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        useLargeTitles()
        babySwitchTapped(babySwitch)
    }
    
    //MARK: - Actions
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        guard let name = animalName.text,
            let species = animalSpecies.text,
            let genderString = animalGender.text,
            let gender = Gender(rawValue: genderString),
            let age = animalAge.text else
            { return }
        
        if babySwitch.isOn {
            let newBaby = BabyAnimal(name: name, species: species, gender: gender, age: age)
            delegate?.addNewBaby(newBaby)
        } else {
            let newAnimal = Animal(name: name, species: species, gender: gender)
            delegate?.addNewAnimal(newAnimal)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func babySwitchTapped(_ sender: UISwitch) {
        animalAge.isEnabled = sender.isOn
        
        if sender.isOn {
            animalAge.text = ""
        } else {
            animalAge.text = "Adult"
        }
    }
    
    //MARK: - Methods
    
    func useLargeTitles() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
