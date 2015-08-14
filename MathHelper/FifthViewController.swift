//
//  FifthViewController.swift
//  MathHelper
//
//  Created by Dragon on 1/5/15.
//  Copyright (c) 2015 Codepixl. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
    
    @IBAction func easter(sender: AnyObject) {
        var easterAlert: UIAlertView = UIAlertView()
        
        easterAlert.title = "Hint"
        easterAlert.message = "Secret code: Bananagram"
        easterAlert.addButtonWithTitle("Done")
        
        easterAlert.show()
    }
    
    @IBAction func welcome(sender: AnyObject) {
        var story = UIStoryboard(name: "Welcome", bundle: NSBundle.mainBundle())
        var view: AnyObject = story.instantiateInitialViewController()
        self.presentViewController(view as! UIViewController, animated: true, completion: nil)
    }
    
    
}