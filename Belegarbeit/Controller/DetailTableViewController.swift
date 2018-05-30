//
//  DetailTableViewController.swift
//  Belegarbeit
//
//  Created by Ali on 26.05.18.
//  Copyright © 2018 Ali. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var item: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = item?.plrname
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        switch indexPath.row{
        case 0:
            cell.textLabel?.text = "1_mbit"
            cell.detailTextLabel?.text = "\(item?.ein_mbit ?? "-")%"
        case 1:
            cell.textLabel?.text = "2_mbit"
            cell.detailTextLabel?.text = "\(item?.zwei_mbit ?? "-")%"
        case 2:
            cell.textLabel?.text = "6_mbit"
            cell.detailTextLabel?.text = "\(item?.sechs_mbit ?? "-")%"
        case 3:
            cell.textLabel?.text = "16_mbit"
            cell.detailTextLabel?.text = "\(item?.sechzehn_mbit ?? "-")%"
        case 4:
            cell.textLabel?.text = "30_mbit"
            cell.detailTextLabel?.text = "\(item?.dreißig_mbit ?? "-")%"
        case 5:
            cell.textLabel?.text = "50_mbit"
            cell.detailTextLabel?.text = "\(item?.fünfzig_mbit ?? "-")%"
        case 6:
            cell.textLabel?.text = "100_mbit"
            cell.detailTextLabel?.text = "\(item?.hundert_mbit ?? "-")%"
        default:
            cell.textLabel?.text = " "
            cell.detailTextLabel?.text = " "
        }
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
