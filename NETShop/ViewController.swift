//
//  ViewController.swift
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

class ViewController: UIViewController {
    
    //
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassWord: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    //
    
    @IBAction func btnLoginAction(_ sender: Any) {
        
        //
        if validate{
            API_login()
        }
        
    }
    
    //
    
    @IBAction func btnForgotPassWordAction(_ sender: Any) {
        
        let ForgotPW = storyboard?.instantiateViewController(withIdentifier: "ForgotPassWordViewController") as! ForgotPassWordViewController
        self.navigationController?.pushViewController(ForgotPW, animated: true)
        
    }
    
    //
    
    @IBAction func btnSingUPAction(_ sender: Any) {
        
        let SingUP = storyboard?.instantiateViewController(withIdentifier: "SingUPViewController") as! SingUPViewController
        self.navigationController?.pushViewController(SingUP, animated: true)
        
    }
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //---------------------------------------------------------------------------------------------------------------------------
    var validate:Bool{
        
        //
        if (txtUserName.text?.trimmingCharacters(in: .whitespaces).isEmpty)!{
            
            print(" Enter Details ")
            let alert = UIAlertController(title: "Message", message: " Please Enter UserName ", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            
        }
        if (txtPassWord.text?.trimmingCharacters(in: .whitespaces).isEmpty)!{
            
            print(" Enter Details ")
            let alert = UIAlertController(title: "Message", message: " Please Enter PassWord ", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        return true
    }
    
    //---------------------------------------------------------------------------------------------------------------------------
    func API_login(){
        
        let url = "http://localhost/app/loginApi.php"
        //let url = "http://localhost/app/api-login.php"
        let param = ["user_email":txtUserName.text!,
                     "user_password":txtPassWord.text!]
        
        Alamofire.request(url, method: .post, parameters: param).responseJSON { (response) in
            switch response.result{
            case .success:
                let responseData =  JSON(response.data)
                let flag = responseData["flag"].stringValue
                let message = responseData["message"].stringValue
                print(flag)
                print(message)
                
                if flag == "1" {
                    
                    let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let HomeVC = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    self.navigationController?.pushViewController(HomeVC, animated: true)
                    
                }
                else{
                let alert = UIAlertController(title: "Message", message: " Enter Valied UserName OR PassWord ", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert,animated: true,completion: nil)
                }
                
                break
            case .failure:
                
                break
            }
        }
        
    }
    
    
}
