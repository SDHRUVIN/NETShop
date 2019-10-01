//
//  SubCategoryViewController.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 28/08/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
import Toast_Swift
import SideMenu

class SubCategoryViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var tblSubCategoryList: UITableView!
    
    var imageURL = "http://localhost/app/uploadPhoto/"
    
    
    var arr_sub_category_id = [String]()
    var arr_sub_category_name = [String]()
    var arr_sub_category_image = [String]()
    //var arr_category_id = [String]()
    var categorys_id = ""
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.API_ListSubCategory()
        self.tblSubCategoryList.delegate = self
        self.tblSubCategoryList.dataSource = self
        // Do any additional setup after loading the view.
        //self.API_ListSubCategory()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_sub_category_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblSubCategoryList.dequeueReusableCell(withIdentifier: "SubCategoryListTableViewCell", for: indexPath) as! SubCategoryListTableViewCell
        cell.lblSubCategoryName.text = arr_sub_category_name[indexPath.row]
        
        
        if let url = URL(string: arr_sub_category_image[indexPath.row]) {
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                if let data = data
                {
                    let imgSubCategory = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgSubCategoryPhoto?.image = imgSubCategory
                    }
                }
            }
        }
        
        
        
        
        /*
        if let MyimageURL = URL(string: self.arr_sub_category_image[indexPath.row])
        {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: MyimageURL)
                if let data = data
                {
                    let myimage = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgSubCategoryPhoto?.image = myimage
                        cell.imgSubCategoryPhoto.layer.cornerRadius = 8.0
                        cell.imgSubCategoryPhoto.image = myimage
                        cell.imgSubCategoryPhoto.clipsToBounds = true
                    }
                }
            }
        }
    */
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ProductVC = storyBoard.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        ProductVC.sub_categorys_id = arr_sub_category_id[indexPath.row]
        self.navigationController?.pushViewController(ProductVC, animated: true)
        //self.present(dvc1,animated: true,completion: nil)
        //ProductVC.sub_category_id = arr_sub_category_id[indexPath.row]
        
    }
    
    
    
    func API_ListSubCategory() {
        
        let url = "http://localhost/app/subcategory-listing.php?category_id=\(categorys_id)"
        
        Alamofire.request(url, method: .post ).responseJSON { (response) in
            
            switch response.result {
            case .success:
                
                print(response.result)
                
                let result = try? JSON(data: response.data!)
                
                 print(result!["subcategory"])
                
                let resultArray = result!["subcategory"]
                
                self.arr_sub_category_id.removeAll()
                self.arr_sub_category_name.removeAll()
                self.arr_sub_category_image.removeAll()
                self.categorys_id.removeAll()
                
                for subCatlist in resultArray.arrayValue {
                    
                    let sub_category_id = subCatlist["sub_category_id"].stringValue
                    self.arr_sub_category_id.append(sub_category_id)
                    
                    let sub_category_name = subCatlist["sub_category_name"].stringValue
                    self.arr_sub_category_name.append(sub_category_name)
                    
                    let sub_category_image = subCatlist["sub_category_photo"].stringValue
                    self.arr_sub_category_image.append(sub_category_image)
                    
                    let category_id = subCatlist["category_id"].stringValue
                    self.categorys_id.append(category_id)
                    print(self.arr_sub_category_name)
                    
                    
                }
                
                self.tblSubCategoryList.reloadData()
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
