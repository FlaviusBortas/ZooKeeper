//
//  AnimalsTableViewController.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/13/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

class AnimalsTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    let database = AnimalDatabase.shared
    var animals = [Animal]()
    var selectedAnimal: Animal?
    
    //MAKR: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        useLargeTitles()
    }
    
    //MARK: - Actions
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
    }
    
    
    //MARK: - Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let animal = animals[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.animal.rawValue, for: indexPath)
        cell.textLabel?.text = "\(animal.name)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedAnimal = animals[indexPath.row]
        
        
        
        performSegue(withIdentifier: SegueTo.animalDetails.rawValue, sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedAnimal = animals[indexPath.row]
            
            animals.remove(at: indexPath.row)
            database.delete(animal: selectedAnimal)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueId = segue.identifier
        
        switch segueId {
        case SegueTo.animalDetails.rawValue:
            guard let animalDetailVC = segue.destination as? AnimalDetailsViewController else {return}
            animalDetailVC.animal = selectedAnimal
            animalDetailVC.delegate = self
        case SegueTo.addAnimal.rawValue:
            guard let addAnimalVC = segue.destination as? AddAnimalViewController else {return}
            addAnimalVC.delegate = self
        default:
            return
        }
    }
    
    func useLargeTitles() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension AnimalsTableViewController: AddAnimalDelegate {
    func addNewAnimal(_ newAnimal: Animal) {
        animals.append(newAnimal)
        database.save(newAnimal: newAnimal)
        tableView.reloadData()
    }
    
    func addNewBaby(_ newBaby: BabyAnimal) {
        animals.append(newBaby)
        database.save(newAnimal: newBaby)
        tableView.reloadData()
    }
}


extension AnimalsTableViewController: EditAnimalDelegate {
    func updateAnimal(_ updatedAnimal: Animal) {
        tableView.reloadData()
        AnimalDatabase.shared.update(editedAnimal: updatedAnimal)
    }
}


