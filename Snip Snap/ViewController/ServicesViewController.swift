//
//  ServicesViewController.swift
//  Snip Snap
//
//  Created by scarecode on 5/15/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController {

    @IBOutlet weak var serviceTable: UITableView!
    var id = "cell"
    
    var serviceData = [ServiceDetails]()
    var rowsSelected = [Int:Bool]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ServicesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        serviceData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! ServicesTableViewCell
        
        if rowsSelected[indexPath.row] != nil {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableView.ScrollPosition.none)
        }
        
        cell.setUpCell(sName: serviceData[indexPath.row].serviceName, price: serviceData[indexPath.row].price)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = UITableViewCell.AccessoryType.none
        rowsSelected.removeValue(forKey: indexPath.row)
    }
    
    
    
    
    
}
