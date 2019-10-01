//
//  SingUPViewController.swift
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

class SingUPViewController: UIViewController {
    
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMobileno: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtPassWord: UITextField!
    
    
    
    @IBAction func btnRagistrationActino(_ sender: Any) {
        
        if validate == true{
            
            API_AddData()
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    @IBAction func btnLoninAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    var validate:Bool{
        if txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Message" , message: "Plesse Enter Name" , preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK" , style: .default , handler: nil)
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
            return false
        }
        if txtMobileno.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Message" , message: "Plesse Enter Mobile no." , preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK" , style: .default , handler: nil)
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
            return false
        }
        if txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Message" , message: "Plesse Enter Email" , preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK" , style: .default , handler: nil)
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
            return false
        }
        if txtGender.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Message" , message: "Plesse Enter Gender" , preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK" , style: .default , handler: nil)
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
            return false
        }
        if txtPassWord.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Message" , message: "Plesse Enter password" , preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK" , style: .default , handler: nil)
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
            return false
        }
        
        return true
    }
    
    //
    func API_AddData(){
        
        let url = "http://localhost/NETShop/api-signup.php"
        let param:Parameters = ["user_name":txtName.text!,
                                "user_gender":txtGender.text!,
                                "user_email":txtEmail.text!,
                                "user_password":txtPassWord.text!,
                                "user_mobile":txtMobileno.text!]
        
        Alamofire.request(url, method: .post, parameters: param).responseJSON { (response) in
            
            switch response.result{
            case .success:
                
                let responseData = JSON(response.data as Any)
                print(responseData)
                let flag = responseData["flag"].stringValue
                let message = responseData["message"].stringValue
                if flag == "1" {
                    let alert = UIAlertController(title: "Message" , message: message , preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK" , style: .default , handler: nil)
                    alert.addAction(ok)
                    self.present(alert,animated: true,completion: nil)
                }
                else {
                    let alert = UIAlertController(title: "Message" , message: message , preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK" , style: .default , handler: nil)
                    alert.addAction(ok)
                    self.present(alert,animated: true,completion: nil)
                }
                
                break
                
            case .failure(let error):
                print(error)
                break
                
            }
            
        }
        
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
