//
//  TestNavigationControllerViewController.swift
//  Reusability
//
//  Created by Adwait Barkale on 30/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit
import SwiftUI

class TestNavigationControllerViewController: UIViewController {

    let logoutImageView = UIImageView(image: UIImage(named: "shutdown"))
    let notificationImageView = UIImageView(image: UIImage(named: "notificationbell"))
    let backButtonImageView = UIImageView(image: UIImage(named: "leftArrow1"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI()
    {
        let width = view.frame.width
        let height = self.navigationController?.navigationBar.frame.height
        let titleView = UIView()
        //titleView.backgroundColor = .brown
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        titleView.frame = .init(x: 0, y: 0, width: width, height: height!)
        logoutImageView.contentMode = .scaleToFill
        notificationImageView.contentMode = .scaleToFill
        backButtonImageView.contentMode = .scaleToFill
        titleView.addSubview(logoutImageView)
        titleView.addSubview(notificationImageView)
        titleView.addSubview(backButtonImageView)
        logoutImageView.frame = .init(x: (navigationController?.navigationBar.frame.width)! - 50, y: (navigationController?.navigationBar.frame.height)! / 2 - 10, width: 25, height: 25)
        notificationImageView.frame = .init(x: (navigationController?.navigationBar.frame.width)! - 90, y: (navigationController?.navigationBar.frame.height)! / 2 - 10, width: 25, height: 25)
        self.navigationItem.titleView = titleView
        backButtonImageView.frame = .init(x: 10, y: (navigationController?.navigationBar.frame.height)! / 2 - 10, width: 25, height: 25)
        
        let backTap = UITapGestureRecognizer(target: self, action: #selector(btnBackTapped))
        backButtonImageView.isUserInteractionEnabled = true
        backTap.numberOfTapsRequired = 1
        backButtonImageView.addGestureRecognizer(backTap)
    }
    
    @objc func btnBackTapped()
    {
        print("Pop")
    }
    
}
