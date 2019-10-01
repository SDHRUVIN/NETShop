//
//  ChangePassWordViewController.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 26/08/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
import Toast_Swift
import SideMenu

class ChangePassWordViewController: UIViewController {
    
    
    
    @IBAction func btnSaveAction(_ sender: Any) {
        
        //
        let ChangePW = storyboard?.instantiateViewController(withIdentifier: "ChangePassWordViewController") as! ChangePassWordViewController
        self.navigationController?.pushViewController(ChangePW, animated: true)
        
        
    }
    
    
    @IBAction func btnCancelAction(_ sender: Any) {
        
        //
        self.navigationController?.popViewController(animated: true)
        
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
