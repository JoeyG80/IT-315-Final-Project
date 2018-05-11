//
//  SubViewController.swift
//  This App is developed as an education project
//  Certain materials are included under the fair use exemption of the U.S. Copyright law
//  and have been prepared according to the multimedia fair use guidelines and are restricted
//  from further use
//
//  Created by Joseph Greenfield.
//
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














