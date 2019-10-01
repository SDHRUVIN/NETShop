//
//  CartViewController.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 11/09/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
import Toast_Swift
import SideMenu

class CartViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    @IBOutlet weak var tblCartList: UITableView!
    
    var imageURL = "http://localhost/app/uploadPhoto/"
    
    var arr_cart_product_id = [String]()
    var arr_cart_product_name = [String]()
    var arr_cart_product_photo = [String]()
    
    var arr_cart_product_qty = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.API_CartList()
        self.tblCartList.delegate = self
        self.tblCartList.dataSource = self
        // Do any additional setup after loading the view.
        self.API_CartList()
        self.tblCartList.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.API_CartList()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_cart_product_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartListTableViewCell") as! CartListTableViewCell
        
        //cell.lblCategoryName!.text = arr_category_name[indexPath.row]
        cell.lblCartName!.text = arr_cart_product_name[indexPath.row]
        
        if let url = URL(string: arr_cart_product_photo[indexPath.row]) {
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                if let data = data
                {
                    let imgCategory = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgCartPhoto?.image = imgCategory
                    }
                }
            }
            return cell
        }
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
            //
            
        }
    }
    
    
    
    
    func API_CartList() {
        
        let url = "http://localhost/app/cart-listing.php"
        
        Alamofire.request(url, method: .post ).responseJSON { (response) in
            switch response.result {
            case .success:
                
                print(response.result)
                
                let cartList = try? JSON(data: response.data!)
                //print(myresult)
                
                let resultArray = cartList!["cart"]
                
                self.arr_cart_product_id.removeAll()
                self.arr_cart_product_name.removeAll()
                self.arr_cart_product_photo.removeAll()
                
                
                for cartList in resultArray.arrayValue {
                    
                    let cart_product_id = cartList["product_id"].stringValue
                    let cart_product_name = cartList["product_name"].stringValue
                    let cart_product_photo = cartList["product_photo"].stringValue
                    
                    self.arr_cart_product_id.append(cart_product_id)
                    self.arr_cart_product_name.append(cart_product_name)
                    self.arr_cart_product_photo.append(cart_product_photo)
                    
                    print(cartList)
                    
                }
                
                self.tblCartList.reloadData()
                
                break
                
                
                
            case .failure:
                
                print(response.error!)
                
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
