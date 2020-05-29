//
//  CalendarViewController.swift
//  Snip Snap
//
//  Created by scarecode on 4/8/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import UIKit
import CalendarKit

class CalendarViewController: DayViewController{
    private var style = CalendarStyle()
    
    override func viewDidLoad() {
        style.timeline.backgroundColor = UIColor.black
        style.header.backgroundColor = UIColor.black
        style.header.daySymbols.weekDayColor = UIColor.white
        style.header.daySelector.inactiveTextColor = UIColor.white
        style.header.swipeLabel.textColor = UIColor.red
        style.header.daySelector.todayActiveTextColor = UIColor.white
        dayView.updateStyle(style)
    }

    
}



