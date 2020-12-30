//
//  BaseViewController.swift
//  Reusability
//
//  Created by Adwait Barkale on 30/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

enum buttonType
{
    case Active
    case Inactive
}

class BaseViewController: UIViewController {
    
    let logoutImageView = UIImageView(image: UIImage(named: "shutdown"))
    let notificationImageView = UIImageView(image: UIImage(named: "notificationbell"))
    let backButtonImageView = UIImageView(image: UIImage(named: "leftArrow1"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    //Using left and Right Bar button Item
    func configureNavBar(title: String,hideBackButton: Bool,hideRightBarButtons: Bool)
    {
        //Common Colors and Titles
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        self.navigationItem.title = title
        //self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .semibold),NSAttributedString.Key.foregroundColor : UIColor.white]
        
        //RightBarButtonItem
        if !hideRightBarButtons{
            let bellImage = UIImage(named: "notificationbell")
            let btn = BadgedButtonItem(with: bellImage)
            btn.setBadge(with: 20)
            btn.tapAction = {
                print("Navigation Bar Notification Button Tapped")
                let notificationVC = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
                //self.navigationController?.view.semanticContentAttribute = .spatial
                //self.present(notificationVC,animated: true)
                self.navigationController?.pushViewController(notificationVC, animated: true)
                //btn.setBadge(with: 5)
            }
            let btnLogout = UIButton(type: .custom)
            btnLogout.frame = .init(x: 0, y: 0, width: 20, height: 20)
            btnLogout.imageView?.contentMode = .scaleAspectFit
            let logoutImage = UIImage(named: "shutdown")
            
            /*
             let viewAspectRatio = btnLogout.bounds.width / btnLogout.bounds.height
             let imageAspectRatio = logoutImage.size.width / logoutImage.size.height
             if viewAspectRatio > imageAspectRatio {
             btnLogout.contentMode = .scaleAspectFill
             } else {
             btnLogout.contentMode = .scaleAspectFit
             }
             */
            
            btnLogout.setImage(logoutImage, for: .normal)
            let rightBarLogout = UIBarButtonItem(customView: btnLogout)
            
            self.navigationItem.rightBarButtonItems = [rightBarLogout,btn]
        }
        //LeftBarButtonItem
        if !hideBackButton
        {
            let backButton = UIButton(type: .custom)
            backButton.frame = .init(x: 0, y: 0, width: 20, height: 20)
            let leftArrowImage = UIImage(named: "leftArrow")
            backButton.setImage(leftArrowImage, for: .normal)
            backButton.addTarget(self, action: #selector(btnBackTapped), for: .touchUpInside)
            let leftBarbutton = UIBarButtonItem(customView: backButton)
            //leftBarbutton.customView?.frame = .init(x: 0, y: 0, width: 30, height: 30)
            self.navigationItem.leftBarButtonItem = leftBarbutton
        }
    }
    
    func configureNavBar1(title: String,hideBackButton: Bool,hideRightBarButtons: Bool)
    {
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        self.navigationController?.navigationBar.tintColor = .white
        
        let titleView = UIView()
        
        let leftView = UIView() //Back Button
        let centerView = UIView() // Title
        let rightView = UIView() // notifications and logout
        
        let logoutImageView = UIImageView(image: UIImage(named: "shutdown"))
        let notificationImageView = UIImageView(image: UIImage(named: "notificationbell"))
        let backButtonImageView = UIImageView(image: UIImage(named: "leftArrow1"))
        
        //Add titleView to bar
        let height = self.navigationController?.navigationBar.frame.height
        titleView.frame = .init(x: 0, y: 0, width: view.frame.width, height: height!)
        //titleView.backgroundColor = .yellow
        self.navigationItem.titleView = titleView
        
        //Add Left View And Right View and Center View to Title View
        //leftView.backgroundColor = .green
        leftView.frame = .init(x: 10, y: 0, width: 35, height: height!)
        titleView.addSubview(leftView)
        
        //rightView.backgroundColor = .green
        rightView.frame = .init(x: self.view.frame.width - 90, y: 0, width: 70, height: height!)
        titleView.addSubview(rightView)
        
        centerView.frame = .init(x: 90, y: 0, width: self.view.frame.width - 105 - 105, height: height!)
        //centerView.backgroundColor = .red
        titleView.addSubview(centerView)
        
        if !hideBackButton{
            //Let's Add Back button to leftView
            backButtonImageView.contentMode = .scaleToFill
            let backTap = UITapGestureRecognizer(target: self, action: #selector(btnBackTapped))
            backButtonImageView.isUserInteractionEnabled = true
            backTap.numberOfTapsRequired = 1
            backButtonImageView.addGestureRecognizer(backTap)
            backButtonImageView.frame = .init(x: 0, y: 3, width: 35, height: 40)
            leftView.addSubview(backButtonImageView)
        }
        
        if !hideRightBarButtons{
            //Let's Add Notification Bell and Logout button
            notificationImageView.contentMode = .scaleToFill
            let notificationTap = UITapGestureRecognizer(target: self, action: #selector(btnNotificationTapped))
            notificationTap.numberOfTapsRequired = 1
            notificationImageView.isUserInteractionEnabled = true
            notificationImageView.addGestureRecognizer(notificationTap)
            notificationImageView.frame = .init(x: 0, y: 10, width: 30, height: 30)
            rightView.addSubview(notificationImageView)
            
            logoutImageView.contentMode = .scaleAspectFit
            //let logoutTap = UITapGestureRecognizer(target: self, action: #selector())
            //logoutTap.numberOfTapsRequired = 1
            //logoutImageView.isUserInteractionEnabled = true
            //logoutImageView.addGestureRecognizer(notificationTap)
            logoutImageView.frame = .init(x: 40, y: 12, width: 25, height: 25)
            rightView.addSubview(logoutImageView)
            
            //Create Badge View and add to top of notification bell
            let badgeView = UIView()
            badgeView.frame = .init(x: 15, y: 5, width: 20, height: 20)
            badgeView.layer.cornerRadius = badgeView.frame.height / 2
            badgeView.backgroundColor = .red
            let lblBadgeNum = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            let appDel = UIApplication.shared.delegate as! AppDelegate
            lblBadgeNum.text = "\(appDel.badgeNum)"
            lblBadgeNum.font = .systemFont(ofSize: 15, weight: .bold)
            lblBadgeNum.textColor = .white
            badgeView.addSubview(lblBadgeNum)
            
            rightView.addSubview(badgeView)
        }
        
        //Let's Add title to Center View via Label
        
        let lblTitle = UILabel(frame: CGRect(x: 0, y: 0, width: centerView.frame.width, height: centerView.frame.height))
        lblTitle.text = title
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lblTitle.numberOfLines = 1
        lblTitle.adjustsFontSizeToFitWidth = true
        lblTitle.textColor = .white
        centerView.addSubview(lblTitle)
        
        
    }
    
    @objc func btnBackTapped()
    {
        print("Pop")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnNotificationTapped()
    {
        print("Notification Button Tapped")
        let notificationVC = storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        self.navigationController?.pushViewController(notificationVC, animated: true)
    }
    
}

extension UIButton
{
    func setButton(buttonType : buttonType,title: String)
    {
        self.setTitle(title, for: .normal)
        switch buttonType {
        case .Active:
            print("Active")
            self.backgroundColor = .link
            self.setTitleColor(.white, for: .normal)
            self.titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
            self.layer.cornerRadius = 5
            self.alpha = 1.0
            self.isUserInteractionEnabled = true
        case .Inactive:
            print("InActive")
            self.backgroundColor = .link
            self.setTitleColor(.white, for: .normal)
            self.titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
            self.layer.cornerRadius = 5
            self.alpha = 0.2
            self.isUserInteractionEnabled = false
        }
        
    }
}


class BadgedButtonItem: UIBarButtonItem {
    
    public func setBadge(with value: Int) {
        self.badgeValue = value
    }
    
    private var badgeValue: Int? {
        didSet {
            if let value = badgeValue,
                value > 0 {
                lblBadge.isHidden = false
                lblBadge.text = "\(value)"
            } else {
                lblBadge.isHidden = true
            }
        }
    }
    
    var tapAction: (() -> Void)?
    
    private let filterBtn = UIButton()
    private let lblBadge = UILabel()
    
    override init() {
        super.init()
        setup()
    }
    
    init(with image: UIImage?) {
        super.init()
        setup(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(image: UIImage? = nil) {
        
        self.filterBtn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        self.filterBtn.adjustsImageWhenHighlighted = false
        self.filterBtn.setImage(image, for: .normal)
        self.filterBtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        self.lblBadge.frame = CGRect(x: 20, y: 0, width: 20, height: 20)
        self.lblBadge.backgroundColor = .red
        self.lblBadge.clipsToBounds = true
        self.lblBadge.layer.cornerRadius = 7
        self.lblBadge.textColor = UIColor.white
        //self.lblBadge.font = UIFont.systemFont(ofSize: 12)
        self.lblBadge.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        self.lblBadge.textAlignment = .center
        self.lblBadge.isHidden = true
        self.lblBadge.minimumScaleFactor = 0.1
        self.lblBadge.adjustsFontSizeToFitWidth = true
        self.filterBtn.addSubview(lblBadge)
        self.customView = filterBtn
    }
    
    @objc func buttonPressed() {
        if let action = tapAction {
            action()
        }
    }
    
}

