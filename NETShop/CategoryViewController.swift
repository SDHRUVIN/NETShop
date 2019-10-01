//
//  CategoryViewController.swift
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

class CategoryViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    @IBOutlet weak var tblCategoryList: UITableView!
    
    
    var imageURL = "http://localhost/app/uploadPhoto/"
    
    
    var arr_category_id = [String]()
    var arr_category_name = [String]()
    var arr_category_photo = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblCategoryList.delegate = self
        self.tblCategoryList.dataSource = self
        
        // Do any additional setup after loading the view.
        self.API_ListCategory()
        self.tblCategoryList.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.API_ListCategory()
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_category_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListTableViewCell") as! CategoryListTableViewCell
        
        cell.lblCategoryName!.text = arr_category_name[indexPath.row]
        
        if let url = URL(string: arr_category_photo[indexPath.row]) {
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                if let data = data
                {
                    let imgCategory = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgCategoryPhoto?.image = imgCategory
                    }
                }
            }
        }
        
        
        
        /*
        if let MyimageURL = URL(string: self.arr_category_photo[indexPath.row])
        {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: MyimageURL)
                if let data = data
                {
                    let myimage = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgCategoryPhoto?.image = myimage
                    }
                }
            }
        }
        */
        
        //cell.lblStudentID.text = arr_student_id[indexPath.row]
        //cell.lblStudentName.text = arr_student_name[indexPath.row]
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
      //  let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let SubCatVC = storyboard?.instantiateViewController(withIdentifier: "SubCategoryViewController") as! SubCategoryViewController
        SubCatVC.categorys_id = arr_category_id[indexPath.row]
        self.navigationController?.pushViewController(SubCatVC, animated: true)
        //self.present(dvc1,animated: true,completion: nil)
        //SubCatVC.categorys_id = arr_category_id[indexPath.row]
        
    }
    
    
    
    
    
    func API_ListCategory() {
        
        let url = "http://localhost/app/category-listing.php"
        
        Alamofire.request(url, method: .post ).responseJSON { (response) in
            switch response.result {
            case .success:
                
                print(response.result)
                
                let catList = try? JSON(data: response.data!)
                //print(myresult)
                
                let resultArray = catList!["category"]
                
                self.arr_category_id.removeAll()
                self.arr_category_name.removeAll()
                self.arr_category_photo.removeAll()
                
                
                for categoryList in resultArray.arrayValue {
                    
                    let category_id = categoryList["category_id"].stringValue
                    let category_name = categoryList["category_name"].stringValue
                    let category_photo = categoryList["category_photo"].stringValue
                    
                    self.arr_category_id.append(category_id)
                    self.arr_category_name.append(category_name)
                    self.arr_category_photo.append(category_photo)
                    
                    print(categoryList)
                    
                }
                
                self.tblCategoryList.reloadData()
                
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
