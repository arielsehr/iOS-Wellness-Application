//
//  Recipes_ViewController.swift
//  wellness
//
//  Created by Ariel Sehr on 5/6/21.
//

import UIKit

class Recipes_ViewController: UIViewController {

    @IBAction func newREcipe(_ sender: Any) {
        
    var bgImage: UIImageView?
    let recipes = ["recipe1.jpg","recipe2.jpg", "recipe3.jpg", "recipe4.jpg"]
   
    //generate random number - associate it with quotes/image arrays
    let randomNum = Int(arc4random_uniform(UInt32(recipes.count)))
            
    let image: UIImage = UIImage(named: recipes[randomNum])!
    bgImage = UIImageView(image: image)
    bgImage!.frame = CGRect(x:75,y:75,width:300,height:600)//CGRectMake values represent x,y,width,height coords

    //animate transition
    UIView.transition(with: self.view, duration: 0.50, options: [.transitionCrossDissolve], animations: {
          self.view.addSubview(bgImage!)
        }, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var bgImage: UIImageView?
        let recipes = ["recipe1.jpg","recipe2.jpg", "recipe3.jpg", "recipe4.jpg"]

    self.view.backgroundColor = UIColor (red: 0.8863, green: 0.7294, blue: 1, alpha: 1)
        
        
        //generate random number - associate it with quotes/images arrays
        let randomNum = Int(arc4random_uniform(UInt32(recipes.count)))
                
        let image: UIImage = UIImage(named: recipes[randomNum])!
        bgImage = UIImageView(image: image)
        bgImage!.frame = CGRect(x:75,y:75,width:300,height:600)//CGRectMake values represent x,y,width,height coords
                
        //display results
        self.view.addSubview(bgImage!)

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
