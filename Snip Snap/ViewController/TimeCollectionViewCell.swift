//
//  TimeCollectionViewCell.swift
//  Snip Snap
//
//  Created by scarecode on 5/14/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var bgView: LoginView!
    
    
    func setUp(time: String, validcell: Bool){
        timeLabel.text = time
        timeLabel.textColor = UIColor.black
        if !validcell{
            bgView.backgroundColor = UIColor.white
            bgView.alpha = 0.5
        }else{
            bgView.backgroundColor = UIColor.white
            bgView.alpha = 1
        }
    
    }
    func selectCell(){
        bgView.backgroundColor = hexStringToUIColor(hex: "#0170FE")
        timeLabel.textColor = UIColor.white

    }
    
    
}
