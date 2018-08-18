//
//  TableViewController.swift
//  Werkstuk1
//
//  Created by Felix Struelens on 17/08/18.
//  Copyright © 2018 Felix Struelens. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var personnages = [Personnage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Personnage1 = Personnage(photo: "Cooper", firstName: "Dale", name: "Cooper", telephone: "049484448", address: "The Great Northern Hotel, 6501 Railroad Ave, WA 98065, Twin Peaks", latitude: 47.542346, longitude: -121.836736)
        let Personnage2 = Personnage(photo: "Laura", firstName: "Laura", name: "Palmer", telephone: "045532349", address: "708 33rd St, WA 98065, Twin Peaks", latitude: 47.973809, longitude: -122.220675)
        let Personnage3 = Personnage(photo: "Leland", firstName: "Leland", name: "Palmer", telephone: "049247345", address: "708 33rd St, WA 98065, Twin Peaks", latitude: 47.973809, longitude: -122.220675)
        let Personnage4 = Personnage(photo: "Sarah", firstName: "Sarah", name: "Palmer", telephone: "045131973", address: "708 33rd St, WA 98065, Twin Peaks", latitude: 47.973809, longitude: -122.220675)
        let Personnage5 = Personnage(photo: "Audrey", firstName: "Audrey", name: "Horne", telephone: "045526965", address: "The Great Northern Hotel, 6501 Railroad Ave, WA 98065, Twin Peaks", latitude: 47.973809, longitude: -122.220675)
        let Personnage6 = Personnage(photo: "Ben", firstName: "Ben", name: "Horne", telephone: "048313249", address: "The Great Northern Hotel, 6501 Railroad Ave, WA 98065, Twin Peaks", latitude: 47.973809, longitude: -122.220675)
        
        personnages.append(Personnage1)
        personnages.append(Personnage2)
        personnages.append(Personnage3)
        personnages.append(Personnage4)
        personnages.append(Personnage5)
        personnages.append(Personnage6)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personnages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCellController

        cell.photo.image = UIImage(named: personnages[indexPath.row].photo)
        cell.firstName.text = personnages[indexPath.row].firstName + " " + personnages[indexPath.row].name

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "naarDetail"
        {
            let vc = segue.destination as! DetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            vc.personnage = personnages[(indexPath?.row)!]
        }
    }
}
