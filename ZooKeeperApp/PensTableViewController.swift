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
    var allPens = Habitat.allHabitats
    var pens: Pen?
    

    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    
    //MARK: - Methods


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard  let pens = pens?.animals.count else { return 0 }
        
        return pens - 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.pen.rawValue, for: indexPath)
        
        guard let animalSpecies = pens?.animals[indexPath.row].species else { return cell }
        
            cell.textLabel?.text = "\(animalSpecies) Pen"
        
        return cell

    }

}
