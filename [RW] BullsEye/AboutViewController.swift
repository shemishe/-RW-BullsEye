//
//  AboutViewController.swift
//  [RW] BullsEye
//
//  Created by Sherman Shi on 3/3/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            
            let url = URL(fileURLWithPath: htmlPath)
            
            let request = URLRequest(url: url)
            
            webView.load(request)
            
        }
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
