//
//  HomeViewController.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 28/08/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import UIKit
import StoreKit

class HomeViewController: UIViewController {
    
    
    
    @IBAction func btnCategory(_ sender: Any) {
        
        let categoryVC = storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        self.navigationController?.pushViewController(categoryVC, animated: true)
        
    }
    
    
    
    @IBAction func btnRateThisApp(_ sender: Any) {
        
        SKStoreReviewController.requestReview()
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
