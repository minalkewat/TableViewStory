//
//  AttractionDetailViewController.swift
//  TableViewStory
//
//  Created by Meenal Kewat on 5/14/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import UIKit
import WebKit

class AttractionDetailViewController: UIViewController,WKNavigationDelegate {
    
    
    @IBOutlet weak var webview: WKWebView!
    
    var website = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("website : \(website)")
        
        let url = URL(string: website)
        let urlRequest:URLRequest = URLRequest(url: url!)
        webview.load(urlRequest)
    }
}
