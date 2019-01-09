//
//  MenuViewController.swift
//  Actinutrition
//
//  Created by Elaine Reyes on 1/19/18.
//  Copyright © 2018 HAPILABS LIMITED. All rights reserved.
//

import UIKit
import SWRevealViewController

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    // MARK: - IBOutlet
    
    @IBOutlet var menuTableView: UITableView!
    @IBOutlet var bottomTableViewConstant: NSLayoutConstraint!
    
    // MARK: - Variables
    
    var mainMenuArray       = [String]()
    var boutiqueArray       = [String]()
    var minceurArray        = [String]()
    var santeArray          = [String]()
    var pourquoiArray       = [String]()
    
    var mainMenuLinksArray  = [String]()
    var boutiqueLinksArray  = [String]()
    var minceurLinksArray   = [String]()
    var santeLinksArray     = [String]()
    var pourquioLinksArray  = [String]()
    
    // MARK: - View Management
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        mainMenuArray       = ContentUtil.sharedInstance.mainMenuContentsArray()
        boutiqueArray       = ContentUtil.sharedInstance.boutiqueMainContentsArray()
        minceurArray        = ContentUtil.sharedInstance.minceurContentsArray()
        santeArray          = ContentUtil.sharedInstance.santeContentsArray()
        pourquoiArray       = ContentUtil.sharedInstance.pourquoiContentsArray()
        
        mainMenuLinksArray  = ContentUtil.sharedInstance.mainMenuLinksArray()
        boutiqueLinksArray  = ContentUtil.sharedInstance.boutiqueMainLinksArray()
        minceurLinksArray   = ContentUtil.sharedInstance.minceurLinksArray()
        santeLinksArray     = ContentUtil.sharedInstance.santeLinksArray()
        pourquioLinksArray  = ContentUtil.sharedInstance.pourquoiLinksArray()
        
        menuTableView.tableFooterView = UIView(frame: .zero)
        
        leftSideMenu()
    }
    
    func leftSideMenu()
    {
        let revealViewController : SWRevealViewController = self.revealViewController()
        
        if (self.revealViewController() != nil)
        {
            revealViewController.presentFrontViewHierarchically = true
            revealViewController.rightViewRevealOverdraw = 0
            revealViewController.rightViewRevealWidth = UIScreen.main.bounds.size.width
            revealViewController.frontViewPosition = FrontViewPosition.leftSideMost
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        if UIScreen.main.nativeBounds.height == 2436
        {
            bottomTableViewConstant.constant = UIApplication.shared.statusBarFrame.size.height + ((self.navigationController?.navigationBar.frame.size.height)! * 2)
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - UITableViewDataSource Methods

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return mainMenuArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section
        {
        case 1:
            return boutiqueArray.count + minceurArray.count + santeArray.count + 1
        
        case 2:
            return pourquoiArray.count + 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cellIdentifier : String = "subMenuCell"
        
        if indexPath.row == 0
        {
            cellIdentifier = "mainMenuCell"
        }
        
        let menuCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainMenuTableViewCell
        
        if indexPath.section == 0
        {
            menuCell?.mainHeaderLabel.text = mainMenuArray[0]
        }
        else if indexPath.section == 1
        {
            if indexPath.row == 0
            {
                menuCell?.mainHeaderLabel.text = mainMenuArray[1]
            }
            else if indexPath.row == 1
            {
                menuCell?.removeTextLabel()
                
                menuCell?.subHeaderLabel.text = boutiqueArray[0]
            }
            else if indexPath.row == 2
            {
                menuCell?.removeTextLabel()
                
                menuCell?.subHeaderLabel.text = boutiqueArray[1]
            }
            else if indexPath.row >= 3 && indexPath.row <= 5
            {
                menuCell?.removeTextLabel()
                
                menuCell?.subLabel.text = minceurArray[indexPath.row - 3]
            }
            else if indexPath.row == 6
            {
                menuCell?.removeTextLabel()
                
                menuCell?.subHeaderLabel.text = boutiqueArray[2]
            }
            else if indexPath.row >= 7
            {
                menuCell?.removeTextLabel()
                
                menuCell?.subLabel.text = santeArray[indexPath.row - 7]
            }
        }
        else if indexPath.section == 2
        {
            if indexPath.row == 0
            {
                menuCell?.mainHeaderLabel.text = mainMenuArray[2]
            }
            else
            {
                menuCell?.removeTextLabel()
                
                menuCell?.tempLabel.text = pourquoiArray[indexPath.row - 1]
            }
        }
        else if indexPath.section == 3
        {
            menuCell?.mainHeaderLabel.text = mainMenuArray[3]
        }
        else if indexPath.section == 4
        {
            menuCell?.mainHeaderLabel.text = mainMenuArray[4]
        }
        
        menuCell?.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        return menuCell!
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            if indexPath.section == 4 && UIScreen.main.bounds.height == 480
            {
                return 80
            }
            
            return 50
        }
        
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let dashboardVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        
        var urlToLoad : String = ""
        
        if indexPath.section == 0
        {
            urlToLoad = mainMenuLinksArray[0]
        }
        else if indexPath.section == 1
        {
            if indexPath.row == 0
            {
                urlToLoad = mainMenuLinksArray[1]
            }
            else if indexPath.row == 1
            {
                urlToLoad = boutiqueLinksArray[0]
            }
            else if indexPath.row == 2
            {
                urlToLoad = boutiqueLinksArray[1]
            }
            else if indexPath.row >= 3 && indexPath.row <= 5
            {
                urlToLoad = minceurLinksArray[indexPath.row - 3]
            }
            else if indexPath.row == 6
            {
                urlToLoad = boutiqueLinksArray[2]
            }
            else if indexPath.row >= 7
            {
                urlToLoad = santeLinksArray[indexPath.row - 7]
            }
        }
        else if indexPath.section == 2
        {
            if indexPath.row == 0
            {
                urlToLoad = mainMenuLinksArray[2]
            }
            else
            {
                urlToLoad = pourquioLinksArray[indexPath.row - 1]
            }
        }
        else if indexPath.section == 3
        {
            urlToLoad = mainMenuLinksArray[3]
        }
        else if indexPath.section == 4
        {
            urlToLoad = mainMenuLinksArray[4]
        }
        
        dashboardVC.urlToLoad = urlToLoad
        
        print("url: \(dashboardVC.urlToLoad)")
        
        self.revealViewController().rightViewController = dashboardVC
        self.revealViewController().rightViewRevealOverdraw = 0
        self.revealViewController().rightViewRevealWidth = UIScreen.main.bounds.size.width
        self.revealViewController().frontViewPosition = FrontViewPosition.leftSideMost
    }
}
