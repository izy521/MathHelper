//
//  Welcome.swift
//  MathHelper
//
//  Created by Dragon on 1/6/15.
//  Copyright (c) 2015 Codepixl. All rights reserved.
//

import UIKit

class Welcome:UIViewController{
    override func viewDidLoad() {
        
    }
    @IBAction func finish(sender: AnyObject) {
        var story = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        var view: AnyObject = story.instantiateInitialViewController()
        self.presentViewController(view as! UIViewController, animated: true, completion: nil)
    }
}
