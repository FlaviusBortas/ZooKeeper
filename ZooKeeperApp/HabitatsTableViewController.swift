//
//  MainTableViewController.swift
//  ZooKeeperApp
//
//  Created by Flavius Bortas on 9/12/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

class HabitatsTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var allHabitats = Habitat.allHabitats
    var selectedHabitat: Habitat?
    
    //MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK: - Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allHabitats.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.habitat.rawValue, for: indexPath)
        cell.textLabel?.text = "\(allHabitats[indexPath.row].climate)".capitalized
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedHabitat = allHabitats[indexPath.row]
        
        performSegue(withIdentifier: SegueTo.pens.rawValue, sender: indexPath.row)
    }
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedHabitat = selectedHabitat else {
            print("No Habitat is Selected")
            return
        }
        
        let segueID = segue.identifier
        
        switch segueID {
        case SegueTo.pens.rawValue:
            guard let pensTVC = segue.destination as? PensTableViewController else {
                print("Failed to Cast Destination VC As PensTVC")
                return
            }
            pensTVC.pens = selectedHabitat.pens
        default:
            return
        }
    }
}
