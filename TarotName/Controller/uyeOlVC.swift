//
//  uyeOlVC.swift
//  Fal Kalesi
//
//  Created by birkan demiral on 10.02.2019.
//  Copyright © 2019 Study. All rights reserved.
//

import UIKit

import SwiftyJSON

import Alamofire

class uyeOlVC: UIViewController {
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBAction func uyeOlBTN(_ sender: Any) {
        
        let url = "https://www.falkalesi.com/uyeolapi.php?v&username=\(self.userNameTF.text!)&password=\(self.passwordTF.text!)&email=\(self.mailTF.text!)"
        
        
        Alamofire.request(url,method: .get).validate().responseJSON{ response in
            
            switch response.result{
                
            case .success(let value):
                
                let json = JSON(value)
                
                let data = json[]

                
                print(data)
                
                if data["result"].stringValue == "false"{
                    
                    let alert = UIAlertController(title: "Hata", message: data["error"].stringValue, preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Kapat", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)

                }else{
                    
                    let alert = UIAlertController(title: "Başarılı", message: "Üyelik Oluşturuldu", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Kapat", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                
                }
               
                
            case.failure(let error):
                
                print("Hata\(error)")
                
                let alert = UIAlertController(title: "Bir Hata Oluştu", message: "Lütfen Bilgilerinizi Kontrol Ediniz", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Kapat", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                
            }
        }
            
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
