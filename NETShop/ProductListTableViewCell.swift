//
//  ProductListTableViewCell.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 06/09/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var lblProductID: UILabel!
    
    
    @IBOutlet weak var imgProductPhoto: UIImageView!
    
    
    @IBOutlet weak var lblProductName: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
