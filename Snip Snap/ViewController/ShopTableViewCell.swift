//
//  ShopTableViewCell.swift
//  Snip Snap
//
//  Created by scarecode on 5/7/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import UIKit
import Cosmos

protocol ShopPickerDelegate : class{
    func didTapNextButton(shopid: String)
}


class ShopTableViewCell: UITableViewCell {

    
    @IBOutlet weak var sortedID: UILabel!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopAddress: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var ratings: CosmosView!
    @IBOutlet weak var card: LoginView!

    var shopID = String()
    weak var delegate :ShopPickerDelegate?
    
    
    func setView(shopid: String, position: Int, shopName sN: String, shopAddress sA: String, distance dist: Double, rating rat: Double, numberofRatings: Int){
        
        
        ratings.settings.fillMode = .precise
        ratings.rating = rat
        shopID = shopid
        //ratings.text = String(numberofRatings)
        sortedID.text = String(position)
        shopName.text = sN
        shopAddress.text = sA
        distance.text = String(format: "%.2f mi", dist)
    
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        delegate?.didTapNextButton(shopid: shopID)
    }

}
