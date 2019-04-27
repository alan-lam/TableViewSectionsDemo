//
//  RadioTableViewController.swift
//  StreetLightDemo
//
//  Created by Alan Lam on 4/27/19.
//  Copyright © 2019 Alan Lam. All rights reserved.
//

import UIKit

class RadioTableViewController: UITableViewController {
    
    let sections = ["About", "LAN Radios", "WAN Radios", "Cellular Radios"]
    let aboutSection = ["by ntrllog", "Support Info"]
    let lanSection = ["Bluetooth LE", "Wifi"]
    let wanSection = ["LoRa", "SigFox"]
    let cellularSection = ["3G", "4G", "5G", "Cat-M1", "NB-IoT"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return aboutSection.count
        case 1: return lanSection.count
        case 2: return wanSection.count
        case 3: return cellularSection.count
        default: return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "radioReuseIdentifier", for: indexPath)

        // Configure the cell...
        switch indexPath.section {
        case 0: cell.textLabel?.text = aboutSection[indexPath.row]
        case 1: cell.textLabel?.text = lanSection[indexPath.row]
        case 2: cell.textLabel?.text = wanSection[indexPath.row]
        case 3: cell.textLabel?.text = cellularSection[indexPath.row]
        default: return cell
        }

        return cell
    }
    
    /* Initialize View Controllers from Main.storyboard */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // For now, handle About/Support
        if (indexPath.section == 0) && (indexPath.row == 1) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "support")
            navigationController?.pushViewController(vc!, animated: true)
        }
        else if (indexPath.section == 1) && (indexPath.row == 0) {
            // BLE Devices
            let vc = storyboard?.instantiateViewController(withIdentifier: "bleStoryboardID")
            navigationController?.pushViewController(vc!, animated: true)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
