//
//  SixthViewController.swift
//  MathHelper
//
//  Created by Dragon on 1/6/15.
//  Copyright (c) 2015 Codepixl. All rights reserved.
//

import UIKit

class SixthViewController:UIViewController{
    @IBOutlet weak var lq_puffin_sw: UISwitch!
    @IBOutlet weak var alg: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Repeat")!)
    }
    
    override func viewDidAppear(animated: Bool) {
        if(NSUserDefaults.standardUserDefaults().boolForKey("alg") == true){
            alg.setTitle("Algebra 1", forState: UIControlState.Normal)
        }else if(NSUserDefaults.standardUserDefaults().boolForKey("alg") == false){
            alg.setTitle("Pre Algebra", forState: UIControlState.Normal)
        }
        lq_puffin_sw.on = NSUserDefaults.standardUserDefaults().boolForKey("lq_puffin")
    }
    
    @IBAction func lq_puffin(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(lq_puffin_sw.on,forKey: "lq_puffin")
    }
    
    @IBAction func alg_actn(sender: AnyObject) {
        if(NSUserDefaults.standardUserDefaults().boolForKey("alg") == true){
            alg.setTitle("Pre Algebra", forState: UIControlState.Normal)
            NSUserDefaults.standardUserDefaults().setBool(false,forKey: "alg")
        }else if(NSUserDefaults.standardUserDefaults().boolForKey("alg") == false){
            alg.setTitle("Algebra 1", forState: UIControlState.Normal)
            NSUserDefaults.standardUserDefaults().setBool(true,forKey: "alg")
        }
    }
}
