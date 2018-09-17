//
//  PensTableViewController.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/13/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

class PensTableViewController: UITableViewController {
    
    //MARK: - Porperties
    var pens = [Pen]()
    var selectedPen: Pen?
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        useLargeTitles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        useLargeTitles()
    }
    
    //MARK: - Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pens.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let penSpecies = pens[indexPath.row].species
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.pen.rawValue, for: indexPath)
        cell.textLabel?.text = "\(penSpecies) Pen"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedPen = pens[indexPath.row]
        
        performSegue(withIdentifier: SegueTo.animal.rawValue , sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedPen = selectedPen else {
            print("No Pen Selected")
            return
        }
        
        
        let segueId = segue.identifier
        
        switch segueId {
        case SegueTo.animal.rawValue:
            guard let animalsTVC = segue.destination as? AnimalsTableViewController else {return}
            animalsTVC.animals = selectedPen.animals
        default:
            return
        }
    }
    
    
    func useLargeTitles() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
}
