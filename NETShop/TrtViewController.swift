//
//  TrtViewController.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 27/08/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import UIKit

class TrtViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnaTry(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnChangePassWord(_ sender: Any) {
        
        let trtVC = storyboard?.instantiateViewController(withIdentifier: "ChangePassWordViewController") as! ChangePassWordViewController
        self.navigationController?.pushViewController(trtVC, animated: true)
        
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
