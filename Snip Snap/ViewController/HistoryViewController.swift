//
//  HistoryViewController.swift
//  Snip Snap
//
//  Created by scarecode on 5/16/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    let tid = "cell"
    var username = String()
    //var historydata = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let un = UserDefaults.standard.string(forKey: "UserName"){
            username = un
        }
        
        
        fetchAppointmentHistory()
        

    }
    func fetchAppointmentHistory(){
        
    }



}
extension HistoryViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tid, for: indexPath)
        return cell
    }
    
    
    
    
}
