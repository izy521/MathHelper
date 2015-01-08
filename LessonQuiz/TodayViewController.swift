//
//  TodayViewController.swift
//  LessonQuiz
//
//  Created by Dragon on 1/3/15.
//  Copyright (c) 2015 Codepixl. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var picker: UIPickerView!
    let chapterData = [1,2,3,4,5,6,7,8,9,10,11,12,13]
    @IBOutlet weak var text: UIButton!
    let lessonData = [1,2,3,4,5,6,7,8,9,10]
    let classData = ["Pre Algebra","Algebra 1"]
    var data = ["ada","01","01"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize.height = 300
        picker.delegate = self
        picker.dataSource = self
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.NewData)
    }
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets{
        return UIEdgeInsetsZero;
    }
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
        println("puffin://www.phschool.com/webcodes10/index.cfm?wcprefix=\(data[0])&wcsuffix=\(data[1])\(data[2])&area=view")
    }
    
    @IBAction func goVid(sender: AnyObject) {
            self.extensionContext!.openURL(NSURL(string:"http://www.phschool.com/webcodes10/index.cfm?wcprefix=\(data[0])&wcsuffix=\(data[1])\(data[2])&area=view")!,nil)
    }
    @IBAction func goPuffin(sender: AnyObject) {
        self.extensionContext!.openURL(NSURL(string:"puffin://www.phschool.com/webcodes10/index.cfm?wcprefix=\(self.data[0])&wcsuffix=\(self.data[1])\(self.data[2])&area=view")!,nil)
    }
    //@IBAction func GoVideo(sender: AnyObject) {
    //UIApplication.sharedApplication().openURL(NSURL(string:"puffin://www.phschool.com/webcodes10/index.cfm?wcprefix=\(data[0])&wcsuffix=\(data[1])\(data[2])&area=view")!)
    //}
}
