//
//  ProductDetailsViewController.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 06/09/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
import Toast_Swift
import SideMenu

class ProductDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var imgProductImage: UIImageView!
    
    @IBOutlet weak var lblProductPrice: UILabel!
    
    @IBOutlet weak var lblProductPriceCurrency: UILabel!
    
    @IBOutlet weak var tvProductDetails: UITextView!
    
    @IBOutlet weak var lblUserID: UILabel!
    
    @IBOutlet weak var txtQuantity: UITextField!
    
    
    
    
    var arr_product_id = String()
    var arr_product_name = String()
    var arr_product_price = String()
    var arr_product_details = String()
    var arr_product_image = String()
    
    var product_id = ""
    
    var product_qty = String()
    
    // mark:- 1- start
    
    //  1- finised
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblProductName.text = arr_product_name
        lblProductPrice.text = arr_product_price
        tvProductDetails.text = arr_product_details
        //imgProductImage.image =
        
        // Do any additional setup after loading the view.
        
        /*
        if ((UserDefaults.standard.object(forKey: "user_name")) != nil) {
            let user_name = lblUserID.text!
            let myUser = UserDefaults.standard.object(forKey: "user_name")
            lblUserID.text = "Hi \(myUser!)"
        }else {
            lblUserID.text = "Please Log In!"
        }
        */
        
        
        let url = "http://localhost/app/productsDetails.php?product_id=\(product_id)"
        
        Alamofire.request(url, method: .post).responseJSON { (Response) in
            
            switch Response.result {
            case .success:
                
                print(Response.result)
                
                let Result = try? JSON(data: Response.data!)
                
                //print(myResult!["category"])
                
                let resultArray = Result!["products"]
                
                self.arr_product_id.removeAll()
                self.arr_product_name.removeAll()
                self.arr_product_price.removeAll()
                self.arr_product_details.removeAll()
                self.arr_product_image.removeAll()
                self.product_qty.removeAll()
                
                
                
                for pd in resultArray.arrayValue {
                    
                    let pro_id = pd["product_id"].stringValue
                    self.arr_product_id.append(pro_id)
                    let pro_name = pd["product_name"].stringValue
                    self.arr_product_name.append(pro_name)
                    let pro_price = pd["product_price"].stringValue
                    self.arr_product_price.append(pro_price)
                    let pro_details = pd["product_details"].stringValue
                    self.arr_product_details.append(pro_details)
                    let pro_image = pd["product_photo"].stringValue
                    self.arr_product_image.append(pro_image)
                    
                    self.lblProductName.text = pro_name
                    self.lblProductPrice.text = pro_price
                    self.tvProductDetails.text = pro_details
                    self.imgProductImage.image = UIImage(named: pro_image)
                    print("******123*****")
                    //self.labelImage.text = pro_image
                    if let imageURL = URL(string: pro_image)
                    {
                        DispatchQueue.global().async {
                            let data = try? Data(contentsOf: imageURL)
                            if let data = data
                            {
                                let myimage = UIImage(data: data)
                                DispatchQueue.main.async {
                                    self.imgProductImage.image = myimage
                                }
                            }
                        }
                    }
                    
                    print(pd)
                }
                
                
                break
                
            case .failure:
                print(Response.error!)
                
                break
            }
        }
        
        //
        
    }
    
    
    
    @IBAction func btnCartView(_ sender: Any) {
        
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let cartVC = storyBoard.instantiateViewController(withIdentifier: "CartViewController")as! CartViewController
        self.navigationController?.pushViewController(cartVC, animated: true)
        
    }
    
    
    @IBAction func btnAdd2Cart(_ sender: Any) {
        
        Api_GetData()
        
    }
    
    
    func Api_GetData() {
        let user_id = 59
        let arr_pro_id = product_id
        let pro_name = lblProductName.text!
        let pro_price = lblProductPrice.text!
        var qty = txtQuantity.text!
        let pro_photo = imgProductImage.image!
        // let pro_imagepath = UIImage(named: "pro_imagepath")
        //let pro_image = imgProductImage.image!
        //        if let MyimageURL = URL(string: self.arr_pro_imagepath[IndexPath.row])
        //        {
        //            DispatchQueue.global().async {
        //                let data = try? Data(contentsOf: MyimageURL)
        //                if let data = data
        //                {
        //                    let myimage = UIImage(data: data)
        //                    DispatchQueue.main.async {
        //                    imageView1?.image = myimage
        //                    }
        //                }
        //            }
        //        }
        print("*************************")
        //
        
        let userdefaults = UserDefaults.standard
        let url = "http://localhost/app/cart-insert.php"
        let param = ["user_id":user_id,
                     "product_id":arr_pro_id,
                     "product_name":pro_name,
                     "product_price":pro_price,
                     "product_qty": qty, // as Any] as [String : Any]
                     "product_photo":pro_photo as Any] as [String : Any]
        
        print(param)
        Alamofire.request(url, method: .post, parameters: param).responseJSON { (response) in
            
            switch response.result{
            case .success:
                let responseData =  JSON(response.data as Any)
                print(responseData)
                let flag = responseData["flag"].stringValue
                let message = responseData["message"].stringValue
                if flag == "1" {
                    
                    let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert,animated: true,completion: nil)
                }else {
                    let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert,animated: true,completion: nil)
                    
                }
                
                break
                
            case .failure:
                break
                
            }
        }
        
        clear()
    }
    func clear(){
        
        txtQuantity.text =  ""
        
        
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
