//
//  MainMenuTableViewCell.swift
//  Actinutrition
//
//  Created by Elaine Reyes on 1/19/18.
//  Copyright © 2018 HAPILABS LIMITED. All rights reserved.
//

import UIKit

class MainMenuTableViewCell: UITableViewCell
{
    // MARK: - IBOutlets
    
    @IBOutlet var mainHeaderLabel: UILabel!
    @IBOutlet var subHeaderLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    
    // MARK: - Variables
    
    var headerCellSection:Int?
    
    // MARK: - View Management
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Functions
    
    func removeTextLabel()
    {
        subHeaderLabel.text     = ""
        subLabel.text           = ""
        tempLabel.text          = ""
    }
}
