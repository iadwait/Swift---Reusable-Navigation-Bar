//
//  SecondViewController.swift
//  Reusability
//
//  Created by Adwait Barkale on 30/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {

    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNext.setButton(buttonType: .Active, title: "Next Page")
        //configureNavBar(title: "Second Screen", hideBackButton: false, hideRightBarButtons: false)
        configureNavBar1(title: "Second Screen", hideBackButton: false, hideRightBarButtons: false)
        
    }
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        
        let nextVC = storyboard?.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    
}
