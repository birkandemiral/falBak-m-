//
//  krediVC.swift
//  Fal Kalesi
//
//  Created by birkan demiral on 11.02.2019.
//  Copyright © 2019 Study. All rights reserved.
//

import UIKit

import Alamofire

import StoreKit


var sharedSecret = "1901b7c3dc744a6a82fbfa9785345999"

class krediVC: UIViewController {

    
    let bundleID = "com.study.FalKalesi.satinAl"
    
    @IBOutlet weak var get: UIButton!
    @IBAction func getCredit(_ sender: Any) {
        IAPService.shared.Purchase(product: .GetCredit)
        
        let url = "https://www.falkalesi.com/krediapi.php?id=\(id)"
        
        Alamofire.request(url,method: .post).responseJSON{ response in}
        
    }
    
    @IBOutlet weak var Buy: UIButton!
    @IBAction func BuyCredit(_ sender: Any) {
        IAPService.shared.Purchase(product: .BuyCredits)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        IAPService.shared.getProducts()
        
        get.setTitle("Kredi Al", for: .normal)
        Buy.setTitle("Kredi Satın Al", for: .normal)
        
        Buy.isHidden = true
        
    }
    
    
}
