//
//  AppointmentDateCollectionViewCell.swift
//  Snip Snap
//
//  Created by scarecode on 5/13/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import UIKit

class AppointmentDateCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var bgView: LoginView!
    @IBOutlet weak var daylabel: UILabel!
    @IBOutlet weak var weekSymbol: UILabel!
    
    func setUp(day: Int, weekdaySym: String){
        daylabel.text = String(day)
        weekSymbol.text = weekdaySym
        bgView.backgroundColor = UIColor.white
        daylabel.textColor = UIColor.black
        weekSymbol.textColor = UIColor.black
    }
    func selectCell(){
        bgView.backgroundColor = hexStringToUIColor(hex: "#0170FE")
        daylabel.textColor = UIColor.white
        weekSymbol.textColor = UIColor.white
    }
}
