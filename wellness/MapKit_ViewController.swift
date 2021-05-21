//
//  WebKit_ViewController.swift
//  wellness
//
//  Created by Ariel Sehr on 5/6/21.
//

import UIKit
import WebKit

class WebKit_ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let htmlUrl = "<iframe width='560' height='315' src='https://www.youtube.com/embed/ml6cT4AZdqI' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
        
        webView.loadHTMLString(htmlUrl, baseURL: nil)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
