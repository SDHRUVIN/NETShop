//
//  WEB_URL.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 13/10/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import Foundation
import UIKit

class WEB_URL: UIViewController {

    static var MAIN_URL = "http://localhost/app/"
    static var IMAGE_URL = "http://localhost/app/upload/"
    
    static var CATEGORIES_URL  = MAIN_URL + "category-listing.php"
    
    static var  SUB_CATEGORY_URL = MAIN_URL + "subcategory-listing.php?category_id="
    
    static var PRODUCTS_URL = MAIN_URL + "products-listing.php?sub_category_id="
    
    static var USERS_URL = MAIN_URL + "/user-display.php?user_id=8"
    
    
}
