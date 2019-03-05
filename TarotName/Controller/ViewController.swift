//
//  ViewController.swift
//  TarotName
//
//  Created by birkan demiral on 8.06.2018.
//  Copyright © 2018 Study. All rights reserved.
//

import UIKit
let activityImage: UIActivityIndicatorView = UIActivityIndicatorView()

let iconSet = ["3","1","2","2","4","6","5","6"]
let falListesi = ["Katina Falı","Kahve Falı","Tarot Falı","Baş Melek Tarotu","Su Falı","Osho Zen Falı","El Falı","Dert Ortağı"]
let linkListesi = [
            "https://www.falkalesi.com/katina-fali-baktir.php",
            "https://www.falkalesi.com/kahve-fali-baktir.php",
            "https://www.falkalesi.com/tarot-fali-baktir.php",
            "https://www.falkalesi.com/tarot-fali-baktir.php",
            "https://www.falkalesi.com/su-fali-baktir.php",
            "https://www.falkalesi.com/yildizname-fali-baktir.php",
            "https://www.falkalesi.com/el-fali-baktir.php",
            "https://www.falkalesi.com/dert-fali-baktir.php"
]
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.image.image = UIImage(named: "\(iconSet[indexPath.row]).png")
        cell.label.text = falListesi[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        link = linkListesi[indexPath.row]
        text = falListesi[indexPath.row]

        // MARK: Activity Indicator
        activityImage.center = self.view.center
        activityImage.hidesWhenStopped = true
        activityImage.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(activityImage)
        activityImage.startAnimating()
        let goVc =  self.storyboard?.instantiateViewController(withIdentifier: "webViewController") as! webViewController
        self.present(goVc,animated: true)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

}

