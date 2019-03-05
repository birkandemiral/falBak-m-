//
//  webViewController.swift
//  TarotName
//
//  Created by birkan demiral on 8.06.2018.
//  Copyright © 2018 Study. All rights reserved.
//

import UIKit

import WebKit

var link = ""
var text = ""
class webViewController: UIViewController,WKNavigationDelegate {

    @IBAction func swipe(_ sender: Any) {
        webView.goBack()

    }
    @IBOutlet var webView: WKWebView!
    
    @IBOutlet var labelTest: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Activity Indicator
        activityImage.center = self.view.center
        activityImage.hidesWhenStopped = true
        activityImage.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(activityImage)
        activityImage.startAnimating()
        // Do any additional setup after loading the view.
        let url = URL(string: link)
        let request = URLRequest(url: url!)
        webView.load(request)
        webView.navigationDelegate = self
        labelTest.text = "\(text) Yükleniyor..."
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Loadedxxxx")
        activityImage.stopAnimating()
        labelTest.isHidden = true
        IAPService.shared.getProducts()
    }
    
}
