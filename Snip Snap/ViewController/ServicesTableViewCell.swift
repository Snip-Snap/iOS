//
//  ServicesTableViewCell.swift
//  Snip Snap
//
//  Created by scarecode on 5/15/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import UIKit

class ServicesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var serviceName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setUpCell(sName: String, price: Double?){
        serviceName.text = sName.uppercased()
        if let p = price{
            priceLabel.text = String(format: "$%.2f", p)
        }else{
            priceLabel.text = "$0.00"
        }
    }
    
}
