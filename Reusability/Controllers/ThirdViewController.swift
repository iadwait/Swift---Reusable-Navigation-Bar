//
//  ThirdViewController.swift
//  Reusability
//
//  Created by Adwait Barkale on 30/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ThirdViewController: BaseViewController {

    
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar1(title: "Third Screen", hideBackButton: false, hideRightBarButtons: false)
        btnNext.setButton(buttonType: .Active, title: "Next Page")
    }

    @IBAction func btnNextTapped(_ sender: UIButton) {
    }
    
    
}
