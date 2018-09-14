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
    
    var animals = [Animal]()
    var selectedAnimal: Animal?
    
    //MAKR: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueId = segue.identifier
        
        switch segueId {
        case SegueTo.animalDetails.rawValue:
            guard let animalDetailVC = segue.destination as? AnimalDetailsViewController else {return}
            animalDetailVC.animal = selectedAnimal
        default:
            return
        }
    }
}
