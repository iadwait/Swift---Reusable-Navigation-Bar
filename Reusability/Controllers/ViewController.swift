//
//  ViewController.swift
//  Reusability
//
//  Created by Adwait Barkale on 30/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet var btnTest: UIButton!
    @IBOutlet var btnTest1: UIButton!
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI()
    {
        btnTest.setButton(buttonType: .Active, title: "Active Button")
        btnTest1.setButton(buttonType: .Inactive, title: "InActive Button")
        btnNext.setButton(buttonType: .Active, title: "Next Page")
        
        btnTest.addTarget(self, action: #selector(btnTestTapped(_:)), for: .touchUpInside)
        btnTest1.addTarget(self, action: #selector(btnTest1Tapped(_:)), for: .touchUpInside)
        
        //Nav Bar
        //configureNavBar(title: "First Screen", hideBackButton: true, hideRightBarButtons: false)
        configureNavBar1(title: "First Screen", hideBackButton: true, hideRightBarButtons: false)
    }
    
    
    @objc func btnTestTapped(_ sender: UIButton)
    {
        print("Test Tapped")
    }
    
    @objc func btnTest1Tapped(_ sender: UIButton)
    {
        print("Test 1 Tapped")
    }
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        
        let nextVC = storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    
}

