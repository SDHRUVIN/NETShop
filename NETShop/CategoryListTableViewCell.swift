//
//  CategoryListTableViewCell.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 28/08/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
import Toast_Swift
import SideMenu

class CategoryListTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var imgCategoryPhoto: UIImageView!
    
    @IBOutlet weak var lblCategoryName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
