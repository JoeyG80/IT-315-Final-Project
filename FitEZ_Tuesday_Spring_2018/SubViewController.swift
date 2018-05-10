//
//  SubViewController.swift
//  FitEZ_Tuesday_Spring_2018
//
//  Created by Don Almeida on 4/17/18.
//  Copyright © 2018 Almeida Org. All rights reserved.
//

import Foundation
import UIKit
import WebKit
class SubViewController : UIViewController {
   
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlToView : String =
            (justThinking.ExerciseURL)
        print("This is the URL: " + urlToView)
        if urlToView != ""
        {
            //let finalString = "http://" + urlToView
            let urlw = URL(string:urlToView)
            let request = URLRequest(url: urlw!)
            webView.load(request)
        }
    }
    
    var justThinking:Exercise = Exercise(exCategory: "", exName: "");
    
    
    
}














