//
//  SecretViewController.swift
//  MathHelper
//
//  Created by Dragon on 1/8/15.
//  Copyright (c) 2015 Codepixl. All rights reserved.
//

import UIKit

class SecretViewController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
    @IBAction func byeneveragainplz(sender: AnyObject) {
        var story = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        var view: AnyObject = story.instantiateInitialViewController()
        self.presentViewController(view as UIViewController, animated: true, completion: nil)
    }
}
