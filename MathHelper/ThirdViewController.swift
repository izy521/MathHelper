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
        if(UIApplication.sharedApplication().canOpenURL(NSURL(string:"puffin://")!) == true){
            UIApplication.sharedApplication().openURL(NSURL(string: "puffin://www.pearsonsuccessnet.com/")!)
        }else{
            var web:SVModalWebViewController = SVModalWebViewController(address: "http://www.pearsonsuccessnet.com/")
            self.presentViewController(web, animated: true, completion: nil)
        }
    }
}