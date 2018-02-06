//
//  AboutViewController.swift
//  bullseye
//
//  Created by Robert Lykins on 2/5/18.
//  Copyright © 2018 Robert Lykins. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){
            
            if let htmlData = try? Data(contentsOf: url){
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    

    /*
     *** Bull's Eye ***
     
     Welcome to the awesome game of Bull's Eye where you can win points and
     fame by dragging a slider.
     
     Your goal is to place the slider as close as possible to the target
     value. The closer you are, the more points score. Enjoy!
    */

}
