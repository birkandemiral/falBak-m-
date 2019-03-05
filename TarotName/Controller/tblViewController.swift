//
//  tblViewController.swift
//  TarotName
//
//  Created by birkan demiral on 8.06.2018.
//  Copyright © 2018 Study. All rights reserved.
//

import UIKit

class tblViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return falListesi.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! falTableViewCell
        // Configure the cell...
        if indexPath.row == 8{
            
            cell.label?.text = "Kredi Satın Al"
            
        }else {
            
            let text = falListesi[indexPath.row]
            cell.label?.text = text
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 8{
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "krediAlNavVC") as! krediAlNavVC
            
            self.present(goVC,animated: true)
        }else{
            
        link = linkListesi[indexPath.row]
            
        text = falListesi[indexPath.row]
            
        let goVc =  self.storyboard?.instantiateViewController(withIdentifier: "webViewController") as! webViewController
      
        self.present(goVc,animated: true)
        
            
        }
    }
    

}
