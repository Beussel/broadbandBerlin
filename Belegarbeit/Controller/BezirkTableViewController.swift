//
//  BezirkTableViewController.swift
//  Belegarbeit
//
//  Created by Ali on 26.05.18.
//  Copyright © 2018 Ali. All rights reserved.
//

import UIKit

class BezirkTableViewController: UITableViewController {
    let networkManager = NetworkManager()
    var bezirk: String = ""
    var result: Result?
    
    var finalArray = [[Item]]()
 
    let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.center = view.center
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        view.addSubview(indicator)
        networkManager.getDataFromApi(bezirk: bezirk, completion: { result in
            self.result = result;
            self.sortieren()
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.indicator.stopAnimating()
            }
            
        })
        self.title = bezirk
    }
    
    
    func sortieren() {
        var list = [String]()
        guard let resultIndex = result?.index else { return }
        for item in resultIndex{
            if list.contains(item.bzrname){
                continue
            }
            finalArray.append(resultIndex.filter {$0.bzrname == item.bzrname})
            list.append(item.bzrname)
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return finalArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return finalArray[section].count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bezirkCell", for: indexPath)

        let item = finalArray[indexPath.section][indexPath.row]
        cell.textLabel?.text = item.plrname
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return finalArray[section].first?.bzrname
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetail" {
            let vc = segue.destination as! DetailTableViewController
            if let index = tableView.indexPathForSelectedRow {
                vc.item = finalArray[index.section][index.row]
            }
            
        }
    }

}
