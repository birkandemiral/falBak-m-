//
//  siViewController.swift
//  TarotName
//
//  Created by birkan demiral on 8.06.2018.
//  Copyright © 2018 Study. All rights reserved.
//

import UIKit

class siViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 148/255, green: 17/255, blue: 0/255, alpha: 1.0)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        // Do any additional setup after loading the view.
    }


}
