//
//  SubCategoryListTableViewCell.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 29/08/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import UIKit

class SubCategoryListTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var imgSubCategoryPhoto: UIImageView!
    
    @IBOutlet weak var lblSubCategoryName: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
