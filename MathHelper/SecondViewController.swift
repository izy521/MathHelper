//
//  SecondViewController.swift
//  MathHelper
//
//  Created by Dragon on 12/9/14.
//  Copyright (c) 2014 Codepixl. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UIAlertViewDelegate {
    @IBOutlet weak var picker: UIPickerView!
    let chapterData = [1,2,3,4,5,6,7,8,9,10,11,12,13]
    let lessonData = [1,2,3,4,5,6,7,8,9,10]
    let classData = ["Pre Algebra","Algebra 1"]
    var data = ["ada","01","01"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        picker.delegate = self
        picker.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        if(NSUserDefaults.standardUserDefaults().boolForKey("alg")){
            picker.selectRow(1, inComponent: 0, animated: true)
            data[0] = "ata"
        }else{
            picker.selectRow(0, inComponent: 0, animated: true)
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
                data[0] = "ada"
            }else if(row == 1){
                data[0] = "ata"
            }
        }else if(component == 1 || component == 2){
            if(row+1 < 10){
                data[component] = "0"+String(row+1)
            }else{
                data[component] = String(row+1)
            }
        }
        println("http://www.phschool.com/webcodes10/index.cfm?wcprefix=\(data[0])&wcsuffix=\(data[1])\(data[2])&area=view")
    }
    
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
        
        switch buttonIndex{
            
        case 0:
            NSLog("Proceed");
            break;
        case 1:
            NSLog("DL");
            UIApplication.sharedApplication().openURL(NSURL(string: "https://itunes.apple.com/us/app/puffin-academy/id716707933?mt=8#")!)
            break;
        default:
            NSLog("Default");
            break;
            //Some code here..
            
        }
    }
    @IBAction func goQuiz(sender: AnyObject) {
        if(NSUserDefaults.standardUserDefaults().boolForKey("lq_builtin")){
            var web:SVModalWebViewController = SVModalWebViewController(address: "http://www.phschool.com/webcodes10/index.cfm?wcprefix=\(self.data[0])&wcsuffix=\(self.data[1])\(self.data[2])&area=view")
            self.presentViewController(web, animated: true, completion: nil)
        }else if(NSUserDefaults.standardUserDefaults().boolForKey("lq_puffin")){
            UIApplication.sharedApplication().openURL(NSURL(string:"puffin://www.phschool.com/webcodes10/index.cfm?wcprefix=\(self.data[0])&wcsuffix=\(self.data[1])\(self.data[2])&area=view")!)
        }else{
            UIApplication.sharedApplication().openURL(NSURL(string:"http://www.phschool.com/webcodes10/index.cfm?wcprefix=\(self.data[0)&wcsuffix=\(self.data[1])\(self.data[2])&area=view")!)
        }
    }
}
