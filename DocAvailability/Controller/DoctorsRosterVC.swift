//
//  ViewController.swift
//  DocAvailability
//
//  Created by Shreya Randive on 9/17/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

class DoctorsRosterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Parser.instance.getTherapistsData { (doctors) in
            print(doctors)
        }
    }


}

