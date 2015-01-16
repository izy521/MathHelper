//
//  ThirdViewController.swift
//  MathHelper
//
//  Created by Dragon on 1/2/15.
//  Copyright (c) 2015 Codepixl. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
    
    @IBAction func button(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "puffin://www.pearsonsuccessnet.com/")!)
    }
}