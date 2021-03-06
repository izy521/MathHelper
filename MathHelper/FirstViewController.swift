//
//  ViewController.swift
//  SwiftUIPickerFormatted
//
//  Created by Steven Lipton on 10/20/14.
//  Copyright (c) 2014
//

import UIKit

class FirstViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UIAlertViewDelegate{
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var chapterPicker: UIPickerView!
    let chapterData = [1,2,3,4,5,6,7,8,9,10,11,12,13]
    let lessonData = [1,2,3,4,5,6,7,8,9,10]
    let classData = ["Pre Algebra","Algebra 1"]
    var data = ["ade","01","01"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        chapterPicker.delegate = self
        chapterPicker.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        if(NSUserDefaults.standardUserDefaults().boolForKey("hasLaunchedOnce")){
            NSLog("launched once")
            otherStuff()
        }else{
            NSLog("Not launched once")
            var story = UIStoryboard(name: "Welcome", bundle: NSBundle.mainBundle())
            var view: AnyObject = story.instantiateInitialViewController()
            var ftnot: UIAlertController = UIAlertController(title: "Welcome!", message: "Welcome to MathHelper! Please select your class.", preferredStyle: .Alert)
            
            var preAlg = UIAlertAction(title: "Pre Algebra", style: UIAlertActionStyle.Destructive){
                UIAlertAction in
                NSUserDefaults.standardUserDefaults().setBool(false,forKey: "alg")
                self.presentViewController(view as! UIViewController, animated: true, completion: nil)
            }
            
            var alg = UIAlertAction(title: "Algebra 1", style: UIAlertActionStyle.Destructive){
                UIAlertAction in
                NSUserDefaults.standardUserDefaults().setBool(true,forKey: "alg")
                self.presentViewController(view as! UIViewController, animated: true, completion: nil)
            }
            ftnot.addAction(alg)
            ftnot.addAction(preAlg)
            
            self.presentViewController(ftnot, animated: true, completion: nil)
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "hasLaunchedOnce")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    //MARK: - Delegates and datasources
    //MARK: Data Sources
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return classData.count
        }else if(component == 1){
            return chapterData.count
        }else if(component == 2){
            return lessonData.count
        }
        return 1
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString! {
        if(component == 0){
            return NSAttributedString(string: classData[row],attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        }else if(component == 1){
            return NSAttributedString(string: "Chapter " + String(chapterData[row]),attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        }else if(component == 2){
            return NSAttributedString(string: "Lesson " + String(lessonData[row]),attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        }
        return NSAttributedString(string: "Error!",attributes: [NSForegroundColorAttributeName : UIColor.redColor()])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            if(row == 0){
                data[0] = "ade"
            }else if(row == 1){
                data[0] = "ate"
            }
        }else if(component == 1 || component == 2){
            if(row+1 < 10){
                data[component] = "0"+String(row+1)
            }else{
                data[component] = String(row+1)
            }
        }
        println("puffin://www.phschool.com/webcodes10/index.cfm?wcprefix=\(data[0])&wcsuffix=\(data[1])\(data[2])&area=view")
        println("row: "+String(row)+" component: "+String(component))
    }
    func showPuffinAlert(){
        /**var createAccountErrorAlert: UIAlertView = UIAlertView()
        
        createAccountErrorAlert.delegate = self
        
        createAccountErrorAlert.title = "Oops!"
        createAccountErrorAlert.message = "It seems you don't have the Puffin Web Browser installed, which may help improve your experience with this app. You may proceed, "
        createAccountErrorAlert.addButtonWithTitle("I understand- Proceed.")
        createAccountErrorAlert.addButtonWithTitle("I'll download Puffin for free.")
        
        createAccountErrorAlert.show()**/
    }
    
    @IBAction func GoVideo(sender: AnyObject) {
        if(UIApplication.sharedApplication().canOpenURL(NSURL(string:"puffin://")!) == true){
            UIApplication.sharedApplication().openURL(NSURL(string:"puffin://www.phschool.com/webcodes10/index.cfm?wcprefix=\(data[0])&wcsuffix=\(data[1])\(data[2])&area=view")!)
        }else{
            var web:SVModalWebViewController = SVModalWebViewController(address: "http://www.phschool.com/webcodes10/index.cfm?wcprefix=\(data[0])&wcsuffix=\(data[1])\(data[2])&area=view")
            self.presentViewController(web, animated: true, completion: nil)
        }
    }
    func showVersionAlert(ver: String){
        let alertController = UIAlertController(title: "New Version!", message: "There is a new version ("+ver+") available for MathHelper! Download it?", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "Yes!", style: .Default) { (action) in
            self.update()
        }
        let cancelAction = UIAlertAction(title: "No, I'll update later.", style: .Destructive) { (action) in
            // ...
        }
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    func update(){
        UIApplication.sharedApplication().openURL(NSURL(string: "http://codepixl.net/MathHelper/?update=true")!)
    }
    
    func otherStuff(){
        if(UIApplication.sharedApplication().canOpenURL(NSURL(string:"puffin://")!) == true){
            println("Can open Puffin links")
        }else{
            showPuffinAlert()
        }
        if(NSUserDefaults.standardUserDefaults().boolForKey("alg")){
            chapterPicker.selectRow(1, inComponent: 0, animated: true)
            data[0] = "ate"
        }else{
            chapterPicker.selectRow(0, inComponent: 0, animated: true)
        }
        var v = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? NSString
        /**if(NSUserDefaults.standardUserDefaults().boolForKey("changeLog") == false){
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "changeLog")
            let url = NSURL(string: "http://codepixl.net/MathHelper/log.txt")
            let request = NSURLRequest(URL: url!)
            NSURLCache.sharedURLCache().removeAllCachedResponses()
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
                var changeLog = "Error getting changelog"
                if(data != nil){
                    changeLog = NSString(data: data, encoding: NSASCIIStringEncoding)! as String
                    if(changeLog.rangeOfString("<html>") != nil){
                        changeLog = "Error getting changelog."
                    }
                }
                let alertController = UIAlertController(title: "New in this version", message: changeLog, preferredStyle: .Alert)
                var ok = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil)
                alertController.addAction(ok)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }**/
    }
}