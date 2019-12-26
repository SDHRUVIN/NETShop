//
//  ProfileViewController.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 07/09/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import UIKit
import Toucan
import Alamofire
import SwiftyJSON
import AlamofireImage
import Toast_Swift
import SideMenu

class ProfileViewController: UIViewController {
    
    
    
    @IBOutlet weak var imgCircularProfile: UIImageView!
    /*
    @IBOutlet weak var bbiEditProfile: UIBarButtonItem!
    
    var image = UIImage(named: "lock .jpg")
    
    image = image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
    
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    self.navigationItem.leftBarButtonItem.frame = CGRectMake(0, 0, 53, 31)
    //image.frame = CGRectMake(0, 0, 53, 31)
    */
    
    
    
    // mark:- it's for some chake
    //let resizedAndMaskedImage = Toucan(image: myImage).resize(CGSize(width: 100, height: 150)).maskWithEllipse().image
    
    
    
    @IBOutlet weak var lblUserName: UILabel!
    
    
    
    //var imageURL = "http://localhost/app/uploadPhoto/"
    
    
    //var arr_user_id = [String]()
    //var arr_user_name = [String]()
    //var arr_user_photo = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgCircularProfile.layer.masksToBounds = true
        imgCircularProfile.layer.cornerRadius = imgCircularProfile.bounds.width / 2
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            //self.API_ListCategory()
            self.fetch_categories_details()
            
        }
    }
    
    
    
    func fetch_categories_details()
    {
        let url = URL(string:WEB_URL.USERS_URL)
        do{
            let allmydata = try Data(contentsOf: url!)
            let adata = try JSONSerialization.jsonObject(with: allmydata, options:JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
            if let arrayJson = adata["user"] as? NSArray
            {
                
                JSONField.arr_user_id.removeAll()
                JSONField.arr_user_name.removeAll()
                JSONField.arr_user_email.removeAll()
                
                
                for index in 0...(adata["user"]?.count)! - 1
                {
                    let object = arrayJson[index]as! [String:AnyObject]
                    
                    let catIdJson = (object["user_id"]as! String)
                    JSONField.arr_user_id.append(catIdJson)
                    
                    let catNameJson = (object["user_name"]as! String)
                    JSONField.arr_user_name.append(catNameJson)
                    //self.lblUserName.text = catNameJson
                    
                    let catImageJson = (object["user_email"]as! String)
                    JSONField.arr_user_email.append(catImageJson)
                    self.lblUserName.text = catImageJson
                    
                }
            }
        }
        catch
        {print("error=\(error)")
        }
    }
    
    
    
    /*
    func API_ListCategory() {
        
        let url = "http://localhost/ApiLogin/api-user-listing.php?user_id=1"
        
        Alamofire.request(url, method: .post ).responseJSON { (response) in
            switch response.result {
            case .success:
                
                print(response.result)
                
                let catList = try? JSON(data: response.data!)
                //print(myresult)
                
                let resultArray = catList!["user"]
                
                self.arr_user_id.removeAll()
                self.arr_user_name.removeAll()
                self.arr_user_photo.removeAll()
                
                
                for ProfileList in resultArray.arrayValue {
                    
                    let user_id = ProfileList["user_id"].stringValue
                    let user_name = ProfileList["user_name"].stringValue
                    let user_photo = ProfileList["user_photo"].stringValue
                    
                    self.arr_user_id.append(user_id)
                    self.arr_user_name.append(user_name)
                    self.arr_user_photo.append(user_photo)
                    
                    //
                    self.lblUserName.text = user_name
                    self.imgCircularProfile.image = UIImage(named: user_photo)
                    
                    
                    print(ProfileList)
                    
                    
                    if let imageURL = URL(string: user_photo)
                        {
                            DispatchQueue.global().async {
                                let data = try? Data(contentsOf: imageURL)
                                if let data = data
                                {
                                    let myimage = UIImage(data: data)
                                    DispatchQueue.main.async {
                                        self.imgCircularProfile.image = myimage
                                    }
                                }
                            }
                        }
                        
                        print(ProfileList)
                    }
                    
                    break
  
            case .failure:
                
                print(response.error!)
                
                break
                
            }
        }
        
    }
    */
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
