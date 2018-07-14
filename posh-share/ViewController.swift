//
//  ViewController.swift
//  posh-share
//
//  Created by znbb on 14/07/2018.
//  Copyright © 2018 znbb. All rights reserved.
//

import UIKit
import WebKit
import JavaScriptCore

class ViewController: UIViewController, WKNavigationDelegate{
    
    @IBOutlet weak var poshWebview: WKWebView!
    @IBOutlet weak var UiView: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shareToParty(_ sender: Any) {
        loadJS(fileName: "share_partys")
    }
    @IBAction func shareListingSelected(_ sender: Any) {
        loadJS(fileName: "share_listing")
    }
    
    func loadJS(fileName: String) {
        var _: JSContext? = {
            let context = JSContext()
            
            guard let
                commonJSPath = Bundle.main.path(forResource: fileName, ofType: "js") else {
                    print("Unable to read resource files.")
                    return nil
            }
            
            do {
                let common = try String(contentsOfFile: commonJSPath, encoding: String.Encoding.utf8)
                _ = poshWebview.evaluateJavaScript(common)
            } catch (let error) {
                print("Error while processing script file: \(error)")
            }
            
            return context
        }()
    }
    
    override func loadView() {
        super.loadView()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.poshmark.com/login")
        let myRequest = URLRequest(url: myURL!)
        poshWebview.load(myRequest)
    }
}
