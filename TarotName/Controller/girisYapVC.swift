//
//  girisYapVC.swift
//  Fal Kalesi
//
//  Created by birkan demiral on 10.02.2019.
//  Copyright © 2019 Study. All rights reserved.
//

import UIKit

import SwiftyJSON

import Alamofire

var id = "0"


class girisYapVC: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var girisYapBTN: UIButton!
    
    @IBAction func girisYapBTN(_ sender: Any) {
        
        let url = URL(string: "https://www.falkalesi.com/uyegirapi.php?g&username=\(userNameTF.text!)&password=\(passwordTF.text!)")!
        
        Alamofire.request(url, method: .get).responseJSON { response in
            
            switch response.result{
                
            case .success(let value):
                
                let json = JSON(value)
                
                id = json["id"].stringValue
                
                print(id)
                
                if json["result"].stringValue == "true"{
                    
                    print("Ok")
                    
                    DispatchQueue.global(qos: .background).async{
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "mainNavVC", sender: self)
                        }
                    }
                }
                
            case.failure(let error):
                
                print(error)
                
            }
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
