//
//  ViewController.swift
//  wellness
//
//  Created by Ariel Sehr on 4/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var lblBMI: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    @IBAction func calc(_ sender: UIButton) {
        
        let wt = Double(txtWeight.text!)
        let ht = Double(txtHeight.text!)
        
        let BMI_1 = ((wt! * 703.0)/(ht!*ht!))
        let BMI_rounded = (BMI_1*100).rounded()/100
        
        lblBMI.text = (BMI_rounded as NSNumber).stringValue
        
        if(BMI_rounded < 18.5) {
            lblStatus.text = "Underweight"
        } else if(BMI_rounded < 25) {
            lblStatus.text = "Healthy weight"
        } else if(BMI_rounded < 30) {
            lblStatus.text = "Overweight"
        } else if(BMI_rounded < 40) {
            lblStatus.text = "Obese"
        } else {
            lblStatus.text = "Very obese"
            let alertController = UIAlertController(title: "ALERT", message: "You look great, but we think you should consider losing weight so you can feel healthy and live a long, full life.", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

